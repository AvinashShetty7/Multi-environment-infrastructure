variable "environment" {
  default = "dev"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "privatesub1_cidr" {
  default = "10.0.0.0/24"
}

variable "privatesub2_cidr" {
  default = "10.0.1.0/24"
}

variable "publicsub2_cidr" {
  default = "10.0.2.0/24"
}

variable "publicsub1_cidr" {
  default = "10.0.3.0/24"
}

