variable "environment" {
  default = "dev"
}

variable "image_id_launchtamplate" {
  default = "ami-01a00762f46d584a1"
}

variable "instance_type_launchtamplate" {
  default =  "t2.micro"
}

variable "keyname_launchtamplate" {
  default = "iam_avinash"
}

variable "subnetsid_loadbalancer" {
  
}

variable "vpc_id" {
  
}

variable "vpc_zone_identifier_to_autoscale" {
  
}

variable "subnetid_for_bastian" {
  
}