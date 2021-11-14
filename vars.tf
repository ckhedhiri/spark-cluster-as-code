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
  default = "keys/taas-spark-key.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
  type = string
  description = "path to private access key in github repository"
  default = "keys/taas-spark-key.pem"
}

variable "PUBLIC_IP_CIDR"{
  type = string
  default = "0.0.0.0/0"
}