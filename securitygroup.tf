resource "aws_security_group" "spark-sg" {
  vpc_id = "${module.vpc.vpc_id}"
  name = "spark-sg"
  description = "Spark master security group"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 8080
      to_port = 8080
      protocol = "tcp"
      cidr_blocks = ["${var.PUBLIC_IP_CIDR}"]
  }

  ingress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["${var.PUBLIC_IP_CIDR}"]
  }
}

resource "aws_security_group" "jupyter-sg" {
  vpc_id = "${module.vpc.vpc_id}"
  name = "jupyter-sg"
  description = "jupyter-sg"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      security_groups = ["${aws_security_group.spark-sg.id}"]
  }

  ingress {
      from_port = 8888
      to_port = 8888
      protocol = "tcp"
      cidr_blocks = ["${var.PUBLIC_IP_CIDR}"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["${var.PUBLIC_IP_CIDR}"]
  }
}