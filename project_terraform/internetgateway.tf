
# creating internet gateway
resource "aws_internet_gateway" "cards-ig-aps01" {
    vpc_id = aws_vpc.Cards-vpcapsouth-1.id

    tags = {
      "Name" = "cards-ig-aps01"
    }
  
}

# creating route table
resource "aws_route_table" "cards-vpc-rt-aps1" {
    vpc_id = aws_vpc.Cards-vpcapsouth-1.id

    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.cards-ig-aps01.id
  }
    
    tags = {
      "Name" = "cards-vpc-rt-aps1"
    }
  
}


#creating the routetable association for subnet-1
resource "aws_route_table_association" "webapp-rtas-subnet-1" {
  
  subnet_id = aws_subnet.Cards-aps1-subnet-1a.id
  route_table_id = aws_route_table.cards-vpc-rt-aps1.id
  
}

#creating route table association for subnet-2
resource "aws_route_table_association" "webapp-rtas-subnet-2" {
  
  subnet_id = aws_subnet.Cards-aps1-subnet-1b.id
  route_table_id = aws_route_table.cards-vpc-rt-aps1.id
  
}

