resource "aws_key_pair" "ec2_key"{
   key_name = "taas-spark-key"
   public_key = file(var.PATH_TO_PUBLIC_KEY)
}