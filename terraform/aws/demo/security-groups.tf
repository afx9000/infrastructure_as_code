resource "aws_security_group" "sg_linux" {
  name        = "sg_linux"
  description = "SG for Linux Servers"
  vpc_id      = "${ module.vpc_demo_us-east-2.vpc_id }"

  ingress {
    from_port   = 0
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "ICMP Echo Reply"
  }

  ingress {
    from_port   = 8
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "ICMP Echo"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound"
  }

  tags {
    "Name" = "sg_linux"
  }
}

resource "aws_security_group" "sg_ingress_http-https_any" {
  name        = "sg_ingress_http-https_any"
  description = "SG for ingress HTTP and HTTPS from anywhere"
  vpc_id      = "${ module.vpc_demo_us-east-2.vpc_id }"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS"
  }

  tags {
    "Name" = "sg_ingress_http-https_any"
  }
}
