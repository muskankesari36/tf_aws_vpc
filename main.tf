provider "aws" {
  region = var.aws_region
}


resource "aws_vpc" "this" {
  cidr_block         = var.vpc_config.cidr_block
  instance_tenancy   = coalesce(var.vpc_config.instance_tenancy, var.vpc_defaults.instance_tenancy)
  enable_dns_support = coalesce(var.vpc_config.enable_dns_support, var.vpc_defaults.enable_dns_support)
  tags = merge({
    Name = var.vpc_config.vpc_name
  }, var.tags)
}