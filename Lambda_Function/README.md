# Lambda-Function

* Modo de uso:



```
module "lambda_function" {
    source              = "git::https://github.com/ctlgpires/Modules-Terraform-AWS//Lambda_Function"   

    filename            = var.filename
    function_name       = format("%s-", var.project)
    handler             = var.handler
    role                = var.role
    runtime             = var.runtime
    description         = var.description
    timeout             = var.timeout
    memory_size         = var.memory_size
    source_code_hash    = filebase64sha256(var.filename)
    vpc_config          = [{
                            subnet_ids          = data.aws_subnet.subnet_app[*].id
                                                
                            security_group_ids  =   [
                                                module.security_group.main[0].id
                                                    ]
                            }]

    variables           =  {
                            variables                             = variavel_de_ambiete
                            }
}
```


# Variables:

| Name                              | Type              | Required  | Default           |
|-----------------------------------|-------------------|-----------|-------------------|
| `tags`                            | map(any)          | no        |                   |
| `extra_tags`                      | map(any)          | no        |                   |
|-----------------------------------|-------------------|-----------|-------------------|
| `filename`                        | string            | no        |                   |
| `s3_bucket`                       | string            | no        |                   |
| `s3_key`                          | string            | no        |                   |
| `s3_object_version`               | string            | no        |                   |
| `function_name`                   | string            | no        |                   |  |
| `handler`                         | string            | yes       |                   |
| `role`                            | string            | yes       |                   |
| `description`                     | string            | no        |                   |
| `layers`                          | list(string)      | no        |                   |
| `memory_size`                     | number            | no        | 1024              |
| `runtime`                         | string            | yes       |                   |
| `timeout`                         | number            | no        | 900               |
| `reserved_concurrent_executions`  | number            | no        |                   |
| `publish`                         | bool              | no        |                   |
| `vpc_config`                      | list(map(any))    | no        |                   |
| - `subnet_ids`                    | list(string)      | yes       |                   |
| - `security_group_ids`            | list(string)      | yes       |                   |
| `variables`                       | map(string)       | no        |                   |
| `source_code_hash`                | string            | no        |                   |


Duvidas: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function