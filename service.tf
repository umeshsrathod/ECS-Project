# ECS Service
resource "aws_ecs_service" "ecs_project_service" {
  name            = "ecs-project-service"
  cluster         = aws_ecs_cluster.ecs-project-cluster.id
  task_definition = aws_ecs_task_definition.ecs_project_task_definition.arn
  desired_count   = var.app_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups = [aws_security_group.ecs_tasks2.id]
    subnets         = aws_subnet.private[*].id
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs-project-target-group.arn
    container_name   = "ecs-project-webapp"
    container_port   = 5000
  }

  depends_on = [aws_lb_listener.ecs-project-listener]

  tags = {
    Name = "ecs-project-service"
  }
}
