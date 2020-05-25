# -----------------------------------------------------------------------------
# Variables: Common AWS Provider - Autoloaded from Terragrunt
# -----------------------------------------------------------------------------

variable "aws_region" {
  description = "The AWS region (e.g. ap-southeast-2). Autoloaded from region.tfvars."
  type        = string
  default     = ""
}

variable "aws_account_id" {
  description = "The AWS account id of the provider being deployed to (e.g. 12345678). Autoloaded from account.tfvars"
  type        = string
  default     = ""
}

variable "aws_assume_role_arn" {
  description = "(Optional) - ARN of the IAM role when optionally connecting to AWS via assumed role. Autoloaded from account.tfvars."
  type        = string
  default     = ""
}

variable "aws_assume_role_session_name" {
  description = "(Optional) - The session name to use when making the AssumeRole call."
  type        = string
  default     = ""
}

variable "aws_assume_role_external_id" {
  description = "(Optional) - The external ID to use when making the AssumeRole call."
  type        = string
  default     = ""
}

variable "availability_zones" {
  description = "(Required) - The AWS avaialbility zones (e.g. ap-southeast-2a/b/c). Autoloaded from region.tfvars."
  type        = list(string)
}

# -----------------------------------------------------------------------------
# Variables: TF-MOD-LAMBDA-REST-API
# -----------------------------------------------------------------------------

// Resource: aws_api_gateway_rest_api
variable "enabled" {
  description = "(Optional) - A Switch that decides whether to create a terraform resource or run a provisioner. Default is true"
  type        = bool
  default     = true
}

variable "lambda_config" {
  type        = map(string)
  default     = {}
  description = "A map of lambda ids and their repective arns"
}

variable "api_name" {
  type        = string
  description = "(Optional) - The name of the REST API"
  default     = ""
}

variable "description" {
  type        = string
  default     = "Managed by Terraform"
  description = "(Optional) - The description of the role."
}

variable "binary_media_types" {
  type        = list(string)
  default     = []
  description = "(Optional) - The list of binary media types supported by the RestApi. By default, the RestApi supports only UTF-8-encoded text payloads."
}

variable "endpoint_type" {
  type        = list(string)
  description = "(Optional) - A list of endpoint types. This resource currently only supports managing a single value. Valid values: EDGE, REGIONAL or PRIVATE. If unspecified, defaults to EDGE."
  default     = ["REGIONAL"]
}

variable "vpc_endpoint_ids" {
  type        = string
  description = "(Optional) - A list of VPC Endpoint Ids. It is only supported for PRIVATE endpoint type."
  default     = null
}

variable "minimum_compression_size" {
  type        = string
  description = "(Optional) Minimum response size to compress for the REST API. Integer between -1 and 10485760 (10MB). Setting a value greater than -1 will enable compression, -1 disables compression (default)."
  default     = "-1"
}

variable "body" {
  type        = string
  default     = ""
  description = "(Optional) - An OpenAPI specification that defines the set of routes and integrations to create as part of the REST API."
}

variable "policy" {
  type        = string
  default     = ""
  description = "(Optional) - JSON formatted policy document that controls access to the API Gateway."
}

variable "api_key_source" {
  type        = string
  default     = "HEADER"
  description = "(Optional) - The source of the API key for requests. Valid values are HEADER (default) and AUTHORIZER."
}

variable "function_names" {
  type        = list(string)
  description = "(Required) - Name of the Lambda function whose resource policy you are updating"
}


variable "cognito_userpool_arn" {
  type        = string
  default     = ""
  description = "Cognito userpool ARN for user authentication"
}

variable "quota_settings" {
  type = object({
    limit  = number
    offset = number
    period = string
  })
  default = {
    limit  = 1000000
    offset = 1
    period = "MONTH"
  }
  description = "(Optional) - Quota Settings Arguments. Full details can be found here https://www.terraform.io/docs/providers/aws/r/api_gateway_usage_plan.html"
}

variable "throttle_settings" {
  type = object({
    burst_limit = number
    rate_limit  = number
  })
  default = {
    burst_limit = 10
    rate_limit  = 20
  }
  description = "(Optional) - Throttle Settings Arguments. Full details can be found here https://www.terraform.io/docs/providers/aws/r/api_gateway_usage_plan.html"
}

# -----------------------------------------------------------------------------
# Variables: TF-MOD-LABEL
# -----------------------------------------------------------------------------

variable "namespace" {
  type        = string
  default     = ""
  description = "(Optional) - Namespace, which could be your abbreviated product team, e.g. 'rci', 'mi', 'hp', or 'core'"
}

variable "environment" {
  type        = string
  default     = ""
  description = "(Optional) - Environment, e.g. 'dev', 'qa', 'staging', 'prod'"
}

variable "name" {
  type        = string
  default     = ""
  description = "(Optional) - Solution name, e.g. 'vault', 'consul', 'keycloak', 'k8s', or 'baseline'"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "(Optional) - Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes`"
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "(Optional) - Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "(Optional) - Additional tags"
}
