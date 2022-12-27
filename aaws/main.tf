terraform {
required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 4.16"
}
}
        required_version = ">= 1.2.0"
}
provider "aws" {
region = "us-east-1"
}

locals {
	instance_names = {"Sagar":"ami-0b5eea76982371e91","Ashok":"ami-0574da719dca65348","Lata":"ami-0be29bafdaad782db","Kirti":"ami-08e637cea2f053dfa","Milind":"ami-050406429a71aaa64","Ojaswi":"ami-0b5eea76982371e91"}
}

resource "aws_instance" "aws_ec2-test" {
	for_each = local.instance_names
	ami = each.value
	instance_type = "t2.micro"
	tags = {
     Name = each.key
 }
}
