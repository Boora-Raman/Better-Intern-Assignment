resource "aws_ecs_cluster" "medusa-cluster" {
  name = "node-app-deployment-cluster"
  tags = {
    name = "node-app-deployment-cluster"
  }
} 
