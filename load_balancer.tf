# Application Load Balancer
resource "aws_lb" "ecs-project-lb" {
  name               = "ecs-project-alb"
  subnets            = aws_subnet.public[*].id
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb2.id]

  tags = {
    Application = "ecs-project-webpage"
  }
}

# Listener for ALB
resource "aws_lb_listener" "ecs-project-listener" {
  load_balancer_arn = aws_lb.ecs-project-lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs-project-target-group.arn
  }
}

# Target Group for ECS Fargate
resource "aws_lb_target_group" "ecs-project-target-group" {
  name        = "ecs-project-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "ip"

  health_check {
    healthy_threshold   = "3"
    interval            = "90"
    protocol            = "HTTP"
    matcher             = "200-299"
    timeout             = "20"
    path                = "/"
    unhealthy_threshold = "2"
  }
}
