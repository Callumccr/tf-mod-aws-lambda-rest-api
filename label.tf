module "label" {
  source             = "git::https://github.com/Callumccr/tf-mod-label.git?ref=master"
  namespace          = var.namespace
  environment        = var.environment
  name               = var.name
  attributes         = var.attributes
  delimiter          = "-"
  additional_tag_map = {} /* Additional attributes (e.g. 1) */
  label_order        = ["environment", "namespace", "name", "attributes"]
}
