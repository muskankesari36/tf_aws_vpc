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
