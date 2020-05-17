## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 >= 2.7.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| availability\_zones | (Required) - The AWS avaialbility zones (e.g. ap-southeast-2a/b/c). Autoloaded from region.tfvars. | `list(string)` | n/a | yes |
| allow\_all\_egress | (Required) - Whether to allow egress to (0.0.0.0/0) from the the security group | `bool` | `true` | no |
| allow\_all\_self | If true, the security group itself will be added as a source to this egress rule. | `bool` | `true` | no |
| allowed\_cidr\_blocks | (Optional) - List of CIDR blocks that are allowed ingress to the security group | `list(string)` | `[]` | no |
| allowed\_security\_groups | (Optional) - List of Security Group IDs that are allowed ingress to the security group | `list(string)` | `[]` | no |
| attributes | (Optional) - Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| aws\_account\_id | The AWS account id of the provider being deployed to (e.g. 12345678). Autoloaded from account.tfvars | `string` | `""` | no |
| aws\_assume\_role\_arn | (Optional) - ARN of the IAM role when optionally connecting to AWS via assumed role. Autoloaded from account.tfvars. | `string` | `""` | no |
| aws\_assume\_role\_external\_id | (Optional) - The external ID to use when making the AssumeRole call. | `string` | `""` | no |
| aws\_assume\_role\_session\_name | (Optional) - The session name to use when making the AssumeRole call. | `string` | `""` | no |
| aws\_region | The AWS region (e.g. ap-southeast-2). Autoloaded from region.tfvars. | `string` | `""` | no |
| delimiter | (Optional) - Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes` | `string` | `"-"` | no |
| enable\_aws\_ip\_ranges | (Optional) -  A Switch that decides whether to provision the security group with IP ranges of various AWS products and services | `bool` | `false` | no |
| enabled | (Optional) -  A Switch that decides whether to create a terraform resource or run a provisioner. Default is true | `bool` | `true` | no |
| environment | (Optional) - Environment, e.g. 'dev', 'qa', 'staging', 'prod' | `string` | `""` | no |
| name | (Optional) - Solution name, e.g. 'vault', 'consul', 'keycloak', 'k8s', or 'baseline' | `string` | `""` | no |
| namespace | (Optional) - Namespace, which could be your abbreviated product team, e.g. 'rci', 'mi', 'hp', or 'core' | `string` | `""` | no |
| port | (Optional) - A list of ports to allow inbound traffic | `list(string)` | `[]` | no |
| regions | (Optional) - Filter IP ranges by regions (or include all regions, if omitted). Valid items are global (for cloudfront) as well as all AWS regions (e.g. eu-central-1) | `list(string)` | `[]` | no |
| services | (Optional) - (Required) Filter IP ranges by services. Valid items are amazon (for amazon.com), amazon\_connect, api\_gateway, cloud9, cloudfront, codebuild, dynamodb, ec2, ec2\_instance\_connect, globalaccelerator, route53, route53\_healthchecks, s3 and workspaces\_gateways. See the service attribute documentation for other possible values. | `list(string)` | `[]` | no |
| tags | (Optional) - Additional tags | `map(string)` | `{}` | no |
| vpc\_id | (Optional) - VPC ID | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| security\_group\_arn | Security Group ARN |
| security\_group\_description | The description of the security group |
| security\_group\_egress | The egress rules |
| security\_group\_id | Security Group ID |
| security\_group\_ingress | The ingress rules |
| security\_group\_name | The name of the security group |

