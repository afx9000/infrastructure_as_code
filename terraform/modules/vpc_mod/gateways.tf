####################
# Internet Gateway #
####################

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "i-gw_${var.env}"
  }
}

################
# NAT Gateways #
################

resource "aws_eip" "nat" {
  count = "${length ( values(var.azs) )}"
  vpc   = true
}

resource "aws_nat_gateway" "natgw" {
  count         = "${length ( values(var.azs) )}"
  allocation_id = "${element(aws_eip.nat.*.id, count.index)}"
  subnet_id     = "${element(aws_subnet.pub.*.id, count.index)}"
  depends_on    = ["aws_internet_gateway.igw"]
}

#################################
# VPN / Virtual Private Gateway #
#################################

resource "aws_vpn_gateway" "vpngw" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "vpn-gw_${var.env}_${var.region}"
  }
}
