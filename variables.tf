variable "aws_region" {
  description = "name of aws_region. Eg. 'us-east-1'"
  type        = string
}
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
variable "vpc_defaults" {
  type = object({
    instance_tenancy   = string
    enable_dns_support = bool
  })
  default = {
    instance_tenancy   = "default"
    enable_dns_support = true
  }
}
variable "vpc_config" {
  type = object({
    vpc_name           = string
    cidr_block         = string
    instance_tenancy   = optional(string)
    enable_dns_support = optional(bool)
  })
}

variable "vpc_flow_log_config_defaults" {
  type = object({
    log_destination_type = string

  })

  default = {
    log_destination_type = "s3"
  }
}

variable "vpc_flow_log_config" {
  type = object({
    enable_vpc_flow_log  = bool
    vpc_flow_log_name    = string
    s3_log_bucket_name   = string
    log_destination_type = optional(string)
    traffic_type         = string
  })
}
