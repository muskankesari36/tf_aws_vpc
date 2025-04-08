# provider "aws" {
#   region = var.aws_region
# }

data "aws_s3_bucket" "this" {

  bucket = var.vpc_flow_log_config.s3_log_bucket_name

}

locals {
  bucket_arn = data.aws_s3_bucket.this.arn
}

resource "aws_vpc" "this" {
  cidr_block         = var.vpc_config.cidr_block
  instance_tenancy   = coalesce(var.vpc_config.instance_tenancy, var.vpc_defaults.instance_tenancy)
  enable_dns_support = coalesce(var.vpc_config.enable_dns_support, var.vpc_defaults.enable_dns_support)
  tags = merge({
    Name = var.vpc_config.vpc_name
  }, var.tags)
}

resource "aws_flow_log" "this" {

  count = var.vpc_flow_log_config.enable_vpc_flow_log ? 1 : 0

  log_destination      = local.bucket_arn
  log_destination_type = var.vpc_flow_log_config_defaults.log_destination_type
  traffic_type         = var.vpc_flow_log_config.traffic_type
  vpc_id               = aws_vpc.this.id
  tags = merge({
    Name = var.vpc_flow_log_config.vpc_flow_log_name
  }, var.tags)
}