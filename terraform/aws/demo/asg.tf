data "aws_ami" "coreos_ami" {
  name_regex  = "^CoreOS-stable-.*-hvm$"
  most_recent = true
  owners      = ["595879546273"]
}

data "template_file" "lc_userdata" {
  template = "${file("userdata_coreos.json")}"
}

module "asg_hello-world" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "2.1.0"

  name = "asg_hello-world"

  # Auto scaling group
  asg_name                  = "asg_hello-world"
  vpc_zone_identifier       = ["${ element(module.vpc_demo_us-east-2.subnet_pub_ids, 0) }"]
  health_check_type         = "EC2"
  min_size                  = 0
  max_size                  = "${ var.instance_number }"
  desired_capacity          = "${ var.instance_number }"
  wait_for_capacity_timeout = 0

  associate_public_ip_address = true

  # Launch configuration
  create_lc       = true
  lc_name         = "lc_hello-world"
  user_data       = "${ data.template_file.lc_userdata.rendered }"
  image_id        = "${ data.aws_ami.coreos_ami.id }"
  instance_type   = "t2.micro"
  security_groups = ["${ aws_security_group.sg_linux.id }", "${ aws_security_group.sg_ingress_http-https_any.id }"]

  root_block_device = [
    {
      volume_size = "12"
      volume_type = "gp2"
    },
  ]
}
