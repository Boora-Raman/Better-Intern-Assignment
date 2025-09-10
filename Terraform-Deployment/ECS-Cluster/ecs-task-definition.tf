resource "aws_ecs_task_definition" "TD" {
  family                   = "node-app-service"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "1024"
  memory                   = "4096"
  execution_role_arn       = var.execution_role_arn
  container_definitions = jsonencode([
    {
      name  = "node-app"
      image = "booraraman/node-app:67abb80f3c2a083b837f5257534cf9b112004fe5"
      essential = true
      portMappings = [
        {
          containerPort = 9000
          hostPort      = 9000
          protocol      = "tcp"
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/ecs/node-app-service"
          "awslogs-region"        = "us-east-1"
          "awslogs-stream-prefix" = "node-app"
          "awslogs-create-group"  = "true"
        }
      }
    }
  ])

  lifecycle {
    create_before_destroy = true
  }
}
