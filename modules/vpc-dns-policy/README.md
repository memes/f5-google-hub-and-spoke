# VPC Cloud DNS policy

This is a simple module to apply a default Cloud DNS policy on VPC networks that allows or denies forwarding of inbound
requests.



<!-- markdownlint-disable MD033 MD034-->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_dns_policy.default_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_network_self_links"></a> [network\_self\_links](#input\_network\_self\_links) | Fully-qualified VPC network self-links to which the Cloud DNS policy will be applied. | `set(string)` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The GCP project identifier where the VPC network will be created. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | A descriptive value to apply to the Cloud DNS policy. Default value is 'Default policy'. | `string` | `"Default policy"` | no |
| <a name="input_enable_inbound_forwarding"></a> [enable\_inbound\_forwarding](#input\_enable\_inbound\_forwarding) | If true (default), allow inbound forwarding as the default DNS policy on provided networks. | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | The name to use when naming resources managed by this module. Must be RFC1035<br>compliant and between 1 and 55 characters in length, inclusive. | `string` | `"restricted"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- markdownlint-enable MD033 MD034 -->
