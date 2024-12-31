# ECS Cluster
resource "aws_ecs_cluster" "ecs-project-cluster" {
  name = "ecs-project-cluster"

  setting {
    name  = "containerInsights"
    value = "enhanced"
  }

  tags = {
    Name = "ecs-project-cluster"
  }
}
