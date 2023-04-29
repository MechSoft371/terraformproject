
#creating target group
resource "aws_lb_target_group" "cards-lb-tg" {
  name     = "cards-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.Cards-vpcapsouth-1.id
}
