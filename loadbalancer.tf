# LoadBalancer
resource "aws_lb" "grotrack_lb" {
  name               = "grotrack-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.frontend_sg.id]

  subnets = [
    aws_subnet.public_za.id,
    aws_subnet.public_zb.id
  ]

  tags = {
    Name = "grotrack-lb"
  }
}

# target group
resource "aws_lb_target_group" "grotrack_tg" {
  name     = "grotrack-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.grotrack_vpc.id

  health_check {
    path = "/"
    port = "80"
  }
}
resource "aws_lb_target_group_attachment" "frontend1" {
  target_group_arn = aws_lb_target_group.grotrack_tg.arn
  target_id        = aws_instance.frontend_grotrack.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "frontend2" {
  target_group_arn = aws_lb_target_group.grotrack_tg.arn
  target_id        = aws_instance.frontend2_grotrack.id
  port             = 80
}

# listener do loadbalancer (abrindo a porta 80)
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.grotrack_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.grotrack_tg.arn
  }
}
