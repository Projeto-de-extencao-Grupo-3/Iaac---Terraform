module "vpc" {
    source = "./vpc"
}

module "cloudwatch" {
    source = "./cloudwatch"
}

module "keypair" {
    source = "./keypair"
}