##################
# public subnets #
##################

resource "aws_subnet" "pub" {
  count                   = "${length ( values(var.azs) )}"
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${element( values(var.subnets_pub), count.index)}"
  availability_zone       = "${element( values(var.azs), count.index )}"
  map_public_ip_on_launch = true

  tags {
    Name = "${var.env}_subnet_public_${element( keys(var.azs), count.index )}"
  }
}

###################
# private subnets #
###################

resource "aws_subnet" "priv" {
  count             = "${length ( values(var.azs) )}"
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${element( values(var.subnets_priv), count.index)}"
  availability_zone = "${element( values(var.azs), count.index )}"

  tags {
    Name = "${var.env}_subnet_priv_${element( keys(var.azs), count.index )}"
  }
}
