#creating taraget listener
resource "aws_lb_listener" "cards-front-end" {
  load_balancer_arn = aws_lb.cards-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.cards-lb-tg.arn
  }
}