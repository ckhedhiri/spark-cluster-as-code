variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "SPARK_TAG_AMI_VERSION"{
  default = "0.1.0"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "SPARK_BIN" {
  default = "spark-2.4.3-bin-hadoop2.7"
}

variable "PUBLIC_IP_CIDR"{
  default = "0.0.0.0/0"
}