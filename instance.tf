data "aws_ami" "spark_ami" {
  most_recent = true

  filter {
    name   = "tag:ami_purpose"
    values = ["spark"]
  }

  filter {
    name   = "tag:ami_version"
    values = [var.SPARK_TAG_AMI_VERSION]
  }
  owners   = ["self"]
}

resource "aws_instance" "spark_master" {
  ami           = data.aws_ami.spark_ami.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ec2_key.key_name
  vpc_security_group_ids = [aws_security_group.spark-sg.id]
  subnet_id = module.vpc.private_subnets[0]
  tags          = {
    "Name" = "spark-master"
  }
  // copy our example script to the server
  provisioner "file" {
    source      = "script/spark_master_init.sh"
    destination = "/tmp/spark_master_init.sh"
  }

  // change permissions to executable and pipe its output into a new file
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/spark_master_init.sh",
      "/tmp/spark_master_init.sh"
    ]
  }
}

resource "aws_instance" "spark_slave" {
  ami           = data.aws_ami.spark_ami.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ec2_key.key_name
  vpc_security_group_ids = [aws_security_group.spark-sg.id]
  subnet_id = module.vpc.private_subnets[0]
  tags          = {
    "Name" = "spark-slave"
  }
  depends_on = [aws_instance.spark_master]

  // copy our example script to the server
  provisioner "file" {
    source      = "script/spark_slave_init.sh"
    destination = "/tmp/spark_slave_init.sh"
  }

  // change permissions to executable and pipe its output into a new file
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/spark_slave_init.sh",
      "/tmp/spark_slave_init.sh " + aws_instance.spark_master.private_dns
    ]
  }
}

resource "aws_instance" "jupyter" {
  ami           = data.aws_ami.spark_ami.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ec2_key.key_name
  vpc_security_group_ids = [aws_security_group.jupyter-sg.id]
  subnet_id = module.vpc.public_subnets[0]
  tags          = {
    "Name" = "jupyter"
  }
  // copy our example script to the server
  provisioner "file" {
    source      = "script/jupyter_init.sh"
    destination = "/tmp/jupyter_init.sh"
  }

  // change permissions to executable and pipe its output into a new file
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/jupyter_init.sh",
      "/tmp/jupyter_init.sh"
    ]
  }
}