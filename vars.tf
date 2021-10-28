variable "AWS_REGION" {
}

variable "SPARK_TAG_AMI_VERSION"{
  default = "0.1.0"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "taas-spark-key.pub"
}

variable "SPARK_BIN" {
  default = "spark-2.4.3-bin-hadoop2.7"
}

variable "PUBLIC_IP_CIDR"{
  default = "0.0.0.0/0"
}