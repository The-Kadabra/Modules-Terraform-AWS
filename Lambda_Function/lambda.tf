#######################
#Recurso Lambda Slicer#
#######################
module "lambda_function" {
    source              = "git::https://github.com/developer-productivity/aws-resources-modules.git//lambda_function"   

    project             = var.project
    environment         = var.environment
    tags                = var.tags  

    filename            = var.filename_slicer
    function_name       = format("%s-slicer", var.project)
    handler             = var.handler
    role                = module.iam_role_lambda_authorizer.main[0].arn
    runtime             = var.runtime
    description         = var.description
    timeout             = var.timeout
    memory_size         = var.memory_size
    source_code_hash    = filebase64sha256(var.filename_slicer)
    vpc_config          = [{
                            subnet_ids          = data.aws_subnet.subnet_app[*].id
                                                
                            security_group_ids  =   [
                                                module.security_group.main[0].id
                                                    ]
                            }]

    variables           =  {
                            ENVIRONMENT                             = lookup(var.environment_lambda, var.environment),
                            SQS_ENDPOINT_URL                        = format("https://sqs.%s.amazonaws.com/", lookup(var.region, var.environment)),
                            SQS_QUEUE_URL                           = format("https://sqs.%s.amazonaws.com/%s/%s", lookup(var.region, var.environment), lookup(var.account, var.environment), var.project),
                            NEW_RELIC_ACCOUNT_ID                    = "2141310",
                            NEW_RELIC_DESTRIBUTED_TRACING_ENABLED   = "true",
                            NEW_RELIC_LICENSE_KEY                   = "d02f7a080ce6b39e9282d65dee9d5ddd5bb3ca81",
                            NEW_RELIC_SERVERLESS_MODE_ENABLED       = "true",
                            NEW_RELIC_TRUSTED_ACCOUNT_KEY           = "2141310"
                            NEW_RELIC_LAMBDA_HANDLER                = "slicer.lambda_handler"
                            }
}