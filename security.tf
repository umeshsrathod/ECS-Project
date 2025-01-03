
### Security group for Load Balancer
resource "aws_security_group" "lb2" {
  name        = "ecs-project-lb-sg2"
  vpc_id      = aws_vpc.main.id
  description = "Controls access to the Application Load Balancer (ALB)"

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ecs-project-lb-sg"
  }
}

### Security group for ECS tasks
resource "aws_security_group" "ecs_tasks2" {
  name        = "ecs-project-ecs-tasks-sg2"
  vpc_id      = aws_vpc.main.id
  description = "Allow inbound access from the ALB only"

  ingress {
    protocol        = "tcp"
    from_port       = 5000
    to_port         = 5000
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = [aws_security_group.lb2.id]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ecs-project-ecs-tasks-sg"
  }
}
