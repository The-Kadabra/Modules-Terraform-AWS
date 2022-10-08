########
#GLOBAL#
########

variable "account" {
    default = {
            api-qa           = "207886776780"
            api-pci          = "077918978000"
            }
}

variable "executions" {
    default = 1
}

variable "project" {
    default = "batch-card-migrator"  
}

variable "tags" {
    default = {
            Channel             = " "
            TopChannel          = "api"
            Domain              = "paymentmethods"
            SubDomain           = " "
            TopDomain           = "psp"
            BusinessUnit        = "Pagamentos Digitais"
            CriticalLevel       = 1
            Email               = "l-pagseguro-berlim@uolinc.com"
            EscalationList      = "l-pagseguro-berlim"
            FilaIm              = "l-pagseguro-berlim"
            Product             = "batch-card-migrator"
            Slack               = "ec_berlim"
            Team                = "Berlim"
            ApplicationRole     = "Application"
            }
}

variable "region" {
    default = {
            api-qa           = "us-east-1"           
            api-pci          = "sa-east-1"

            }
}

variable "profile" {
    default = {
            api-qa           = "api-qa"
            api-pci          = "api-pci"
            }
}

variable "environment" {
}