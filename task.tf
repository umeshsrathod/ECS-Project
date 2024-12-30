# ECS Task Definition
resource "aws_ecs_task_definition" "ecs_project_task_definition" {
  family                   = "ecs-project-webapp"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 2048
  memory                   = 4096

  container_definitions = <<DEFINITION
[
  {
    "image": "deleonabowu/javaapp:latest",
    "cpu": 2048,
    "memory": 4096,
    "name": "ecs-project-webapp",
    "networkMode": "awsvpc",
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ]
  }
]
DEFINITION

  tags = {
    Name = "ecs-project-task-definition"
  }
}

