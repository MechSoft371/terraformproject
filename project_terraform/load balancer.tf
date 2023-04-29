#creating load balancer

resource "aws_lb" "cards-lb" {
  name               = "cards-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.card-sg-1.id]
  subnets            = [aws_subnet.Cards-aps1-subnet-1a.id, aws_subnet.Cards-aps1-subnet-1b.id]


  tags = {
    Environment = "dev"
  }
}