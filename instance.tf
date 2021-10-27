data "aws_ami" "spark_ami" {
  most_recent = true

  filter {
    name   = "tag:ami_purpose"
    values = ["spark"]
  }

  filter {
    name   = "tag:ami_version"
    values = ["${var.SPARK_TAG_AMI_VERSION}"]
  }
  owners   = ["self"]
}

data "template_file" "spark_master_init" {
  template = "${file("script/spark_master_init.tpl")}"
  vars = {
    spark_bin = "${var.SPARK_BIN}"
  }
}

data "template_file" "spark_slave_init" {
  template = "${file("script/spark_slave_init.tpl")}"
  vars = {
    spark_master_private_dns = "${aws_instance.spark_master.private_dns}"
    spark_bin = "${var.SPARK_BIN}"
  }
}

data "template_file" "jupyter_init" {
  template = "${file("script/jupyter_init.tpl")}"
}

resource "aws_instance" "spark_master" {
  ami           = "${data.aws_ami.spark_ami.id}"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.ec2_key.key_name}"
  vpc_security_group_ids = ["${aws_security_group.spark-sg.id}"]
  subnet_id = "${module.vpc.private_subnets[0]}"
  user_data = "${data.template_file.spark_master_init.rendered}"
  tags          = {
    "Name" = "spark-master"
  }
}

resource "aws_instance" "spark_slave" {
  ami           = "${data.aws_ami.spark_ami.id}"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.ec2_key.key_name}"
  vpc_security_group_ids = ["${aws_security_group.spark-sg.id}"]
  subnet_id = "${module.vpc.private_subnets[0]}"
  user_data = "${data.template_file.spark_slave_init.rendered}"
  tags          = {
    "Name" = "spark-slave"
  }
  depends_on = [aws_instance.spark_master]
}

resource "aws_instance" "jupyter" {
  ami           = "${data.aws_ami.spark_ami.id}"
  instance_type = ""
  key_name      = "${aws_key_pair.ec2_key.key_name}"
  vpc_security_group_ids = ["${aws_security_group.jupyter-sg.id}"]
  subnet_id = "${module.vpc.public_subnets[0]}"
  user_data = "${data.template_file.jupyter_init.rendered}"
  tags          = {
    "Name" = "jupyter"
  }
}