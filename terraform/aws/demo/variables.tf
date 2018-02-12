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

####################
# Server variables #
####################

variable "instance_number" {
  type        = "string"
  description = "Number of instances to run in autoscaling group"
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
