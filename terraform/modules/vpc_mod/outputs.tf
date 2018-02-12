output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "rt-pub_id" {
  value = "${aws_route_table.rt-pub.id}"
}

output "rt-priv_ids" {
  value = ["${aws_route_table.rt-priv.*.id}"]
}

output "subnet_pub_ids" {
  value = ["${aws_subnet.pub.*.id}"]
}

output "subnet_priv_ids" {
  value = ["${aws_subnet.priv.*.id}"]
}

output "vpn-gw_id" {
  value = "${aws_vpn_gateway.vpngw.id}"
}
