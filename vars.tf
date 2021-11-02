variable "AWS_REGION" {
}

variable "SPARK_TAG_AMI_VERSION"{
  type = string
  description = "version of AMI to load"
  default = "0.1.0"
}

variable "PATH_TO_PUBLIC_KEY" {
  type = string
  description = "path to public access key in github repository"
  default = "taas-spark-key.pub"
}

variable "SPARK_BIN" {
  type = string
  description = "spark path"
  default = "spark-3.2.0-bin-hadoop3.2-scala2.13"
}

variable "PUBLIC_IP_CIDR"{
  type = string
  default = "0.0.0.0/0"
}