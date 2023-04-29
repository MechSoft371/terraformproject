resource "aws_launch_template" "card-app-LT" {
  name = "card-app-LT"
  block_device_mappings {
    device_name = "/dev/sdf"
    ebs {
      volume_size = 8
    }
  }

  image_id = "ami-001d2d7393080bdc3"
  instance_type = "t2.micro"

  key_name = aws_key_pair.cards-key.id
  vpc_security_group_ids = [aws_security_group.card-sg-1.id]

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "card-app"
    }
  }
  user_data = filebase64("input.sh")
}



# Auto scaling group
resource "aws_autoscaling_group" "card-app-ASG" {
  desired_capacity   = 2
  max_size           = 5
  min_size           = 2
  vpc_zone_identifier = [aws_subnet.Cards-aps1-subnet-1a.id,aws_subnet.Cards-aps1-subnet-1b.id]
  # if we restrict vpc_zone_identifier to our required subnet's the instances will be created in those subnet's
  target_group_arns = [aws_lb_target_group.cards-lb-tg.arn]

  launch_template {
    id      = aws_launch_template.card-app-LT.id
    version = "$Latest"
  }
}