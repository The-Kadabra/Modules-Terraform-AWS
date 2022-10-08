################################################
#Data Subnet Caso queira usar a SUB com o data #
################################################
data "aws_subnet" "subnet_app" {
    count     = length(lookup(var.vpc_subnet, var.environment))
        filter {
            name    = "tag:Name"
            values  = [
                element(lookup(var.vpc_subnet, var.environment), count.index)
        ]
    }
}