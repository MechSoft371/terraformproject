resource "aws_subnet" "Cards-aps1-subnet-1a" {
    vpc_id = aws_vpc.Cards-vpcapsouth-1.id
    cidr_block = "10.10.1.0/24"
    availability_zone = "ap-south-1a"
    map_public_ip_on_launch = true

  tags = {
    Name = "Cards-aps1-subnet"
  }
  
}


resource "aws_subnet" "Cards-aps1-subnet-1b" {
    vpc_id = aws_vpc.Cards-vpcapsouth-1.id
    cidr_block = "10.10.2.0/24"
    availability_zone = "ap-south-1b"
    map_public_ip_on_launch = true

  tags = {
    Name = "Cards-aps1-subnet-1b"
  }
  
}


# resource "aws_subnet" "Cards-aps1-subnet-2a" {
#     vpc_id = aws_vpc.Cards-vpcapsouth-1.id
#     cidr_block = "10.10.1.0/24"
#     availability_zone = "ap-south-1a"
#     map_public_ip_on_launch = true

#   tags = {
#     Name = "Cards-aps1-subnet-1c"
#   }
  
# }