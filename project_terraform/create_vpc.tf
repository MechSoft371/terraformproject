#creating VPC

resource "aws_vpc" "Cards-vpcapsouth-1" {
    cidr_block = "10.10.0.0/16"
    instance_tenancy = "default"

    tags = {
      Name = "Cards-vpcapsouth-1"
    }
}