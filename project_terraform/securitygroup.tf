# creating a security group
resource "aws_security_group" "card-sg-1" {
  name        = "card-sg-1"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.Cards-vpcapsouth-1.id

 ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    description = "HTTPs from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "card-sg-1"
  }
}