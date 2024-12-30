# ECS Cluster
resource "aws_ecs_cluster" "ecs-project-cluster" {
  name = "ecs-project-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = {
    Name = "ecs-project-cluster"
  }
}
