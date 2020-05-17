# -----------------------------------------------------------------------------
# Outputs: TF-MOD-LAMBDA-REST-API
# -----------------------------------------------------------------------------

output "api_id" {
  value       = aws_api_gateway_rest_api.default.*.id
  description = "The ID of the REST API"
}

output "created_date" {
  value       = aws_api_gateway_rest_api.default.*.created_date
  description = "The creation date of the REST API"
}

output "execution_arn" {
  value       = aws_api_gateway_rest_api.default.*.execution_arn
  description = "The execution ARN part to be used in lambda_permission's source_arn when allowing API Gateway to invoke a Lambda function, e.g. arn:aws:execute-api:eu-west-2:123456789012:z4675bid1j, which can be concatenated with allowed stage, method and resource path."
}

output "arn" {
  value       = aws_api_gateway_rest_api.default.*.arn
  description = "The Amazon Resource Name (ARN)"
}
