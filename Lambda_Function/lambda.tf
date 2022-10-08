resource "aws_lambda_function" "main" {

    tags                            = var.tags

    filename                        = var.filename
    function_name                   = var.function_name
    handler                         = var.handler
    role                            = var.role
    description                     = var.description
    layers                          = var.layers
    memory_size                     = var.memory_size
    runtime                         = var.runtime
    timeout                         = var.timeout
    reserved_concurrent_executions  = var.reserved_concurrent_executions
    publish                         = var.publish
    source_code_hash                = var.source_code_hash
    vpc_config          =   [{
                            subnet_ids          = ["ZONA DA SUB A","ZONA DA SUB B"]
                                                
                            security_group_ids  =   [
                                                    "Security Group IDs"
                                                    ]
                            }]
    environment {
        variables                     = var.variables
                }
}