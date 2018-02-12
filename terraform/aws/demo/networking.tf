module "vpc_demo_us-east-2" {
  source = "../../modules/vpc_mod"

  azs          = "${ var.azs }"
  env          = "${ var.env }"
  region       = "${ var.region }"
  subnets_pub  = "${ var.subnets_pub }"
  subnets_priv = "${ var.subnets_priv }"
  vpc_cidr     = "${ var.vpc_cidr }"
}
