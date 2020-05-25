
resource "aws_api_gateway_rest_api" "default" {
  count                    = var.enabled && length(list(var.api_name)) > 0 ? 1 : 0
  name                     = var.api_name
  description              = var.description
  policy                   = var.policy
  api_key_source           = var.api_key_source
  body                     = data.template_file.default.rendered
  binary_media_types       = var.binary_media_types
  minimum_compression_size = var.minimum_compression_size
  tags                     = module.label.tags

  dynamic "endpoint_configuration" {
    for_each = length(var.endpoint_type) > 0 ? var.endpoint_type : []
    iterator = endpoint
    content {
      types = [endpoint.value]
    }
  }
}

resource "aws_lambda_permission" "default" {
  count         = var.enabled && length(list(var.function_names)) > 0 ? length(var.function_names) : 0
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = element(var.function_names, count.index)
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.default.0.execution_arn}/*/*/*"
}

resource "aws_api_gateway_deployment" "default" {
  count       = var.enabled && aws_api_gateway_rest_api.default.*.id != null ? 1 : 0
  rest_api_id = aws_api_gateway_rest_api.default.0.id
  stage_name  = module.label.environment
}

resource "aws_api_gateway_api_key" "default" {
  count       = var.enabled ? 1 : 0
  name        = module.label.id
  description = "API key for ${aws_api_gateway_rest_api.default.0.id}"
}

resource "aws_api_gateway_usage_plan" "default" {
  count       = var.enabled ? 1 : 0
  name        = module.label.id
  description = "Usage plan for ${aws_api_gateway_rest_api.default.0.id},${var.description}"
  api_stages {
    api_id = aws_api_gateway_rest_api.default.0.id
    stage  = aws_api_gateway_deployment.default.0.stage_name
  }
  quota_settings {
    limit  = var.quota_settings.limit
    offset = var.quota_settings.offset
    period = var.quota_settings.period
  }
  throttle_settings {
    burst_limit = var.throttle_settings.burst_limit
    rate_limit  = var.throttle_settings.rate_limit
  }
}

resource "aws_api_gateway_usage_plan_key" "api_usage_plan_key_loop" {
  count         = var.enabled ? 1 : 0
  key_id        = aws_api_gateway_api_key.default.0.id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.default.0.id
}
