########
#GLOBAL#
########
variable "project" {
    default = "Nome-do-Projeto"  
}

variable "tags" {
    default = {
            E-mail             = ""
            Time               = ""
            }
}


#########
#LAMBDA #
#########
variable "filename" {
    type    = string
    default = "binario.zip"
}
variable "handler" {
    type    = string
    default = "lambda_handler"
}
variable "description" {
    type    = string
    default = "https://URL-DO-REPO"
}
variable "runtime" {
    type    = string
    default = "python3.8"
}
variable "timeout" {
    type    = number
    default = 900
}
variable "memory_size" {
    default = "1024"
}

variable "role" {
    default = "arn:aws:iam::aws:policy/service-role/AWSLambdaRole"
}

########
#SUBNET#
########

variable "subnet_ids" {
    type    = string
    default = ""
}