data "template_file" "default" {
  /* renders and updates the json manifest with terraform vars */
  template = file("${path.module}/source/cms.json")
  vars = {
    environment = var.environment
    region      = var.aws_region
    cognito     = var.cognito_userpool_arn
    api_id      = module.label.id
    function_04 = lookup(var.lambda_config, "AciemCMS_CMSAsset", "")
    function_05 = lookup(var.lambda_config, "AciemCMS_CMSAsset_clearCache", "")
    function_06 = lookup(var.lambda_config, "AciemCMS_CMSAsset_getByJobAndAsset", "")
    function_07 = lookup(var.lambda_config, "AciemCMS_CMSAsset_getByJobAndAssetDesc", "")
  }
}

resource "local_file" "default" {
  content  = data.template_file.default.rendered
  filename = "${path.module}/rendered/${module.label.id}.json"
}
