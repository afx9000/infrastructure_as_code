################
# Route Tables #
################

resource "aws_route_table" "rt-pub" {
  vpc_id = "${aws_vpc.main.id}"

  propagating_vgws = ["${aws_vpn_gateway.vpngw.id}"]

  tags {
    Name = "${var.env}_rt_pub"
  }
}

resource "aws_route_table" "rt-priv" {
  count  = "${length ( values(var.azs) )}"
  vpc_id = "${aws_vpc.main.id}"

  propagating_vgws = ["${aws_vpn_gateway.vpngw.id}"]

  tags {
    Name = "${var.env}_rt_priv_${element( keys(var.azs), count.index )}"
  }
}

##################
# Default Routes #
##################

resource "aws_route" "rt-pub_default_route" {
  route_table_id         = "${aws_route_table.rt-pub.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.igw.id}"
}

resource "aws_route" "rt-priv_default_route" {
  count                  = "${length ( values(var.azs) )}"
  route_table_id         = "${element(aws_route_table.rt-priv.*.id, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${element(aws_nat_gateway.natgw.*.id, count.index)}"
}

############################
# Route Table Associations #
############################

resource "aws_route_table_association" "pub" {
  count          = "${length ( values(var.azs) )}"
  subnet_id      = "${element(aws_subnet.pub.*.id, count.index)}"
  route_table_id = "${aws_route_table.rt-pub.id}"
}

resource "aws_route_table_association" "priv" {
  count          = "${length ( values(var.azs) )}"
  subnet_id      = "${element(aws_subnet.priv.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.rt-priv.*.id, count.index)}"
}
