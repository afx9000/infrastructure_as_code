##################
# REGION AND ENV #
##################

variable "env" {
  type        = "string"
  description = "Name of the environment"
}

variable "region" {
  type        = "string"
  description = "AWS Region"
}

#####################
# Network variables #
#####################

variable "vpc_cidr" {
  type        = "string"
  description = "CIDR of the VPC"
}

variable "subnets_pub" {
  type        = "map"
  description = "CIDRs of Public Subnets"
}

variable "subnets_priv" {
  type        = "map"
  description = "CIDRs of Private Subnets"
}

###############################
# Availability Zone variables #
###############################

variable "azs" {
  type        = "map"
  description = "Availability Zones"
}
