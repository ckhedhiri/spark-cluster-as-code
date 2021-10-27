output "spark-master" {
  value = "${aws_instance.spark_master.public_dns}"
}

output "private-ip-spark-master" {
  value = "${aws_instance.spark_master.private_ip}"
}

output "private-ip-spark-slave" {
  value = "${aws_instance.spark_slave.private_ip}"
}

output "jupyter" {
  value = "${aws_instance.jupyter.public_dns}"
}