resource "aws_ecs_task_definition" "task_def" {
  family = var.family
  requires_compatibilities = [ var.requ_comp ]
  network_mode = "awsvpc"
  cpu = 1024
  memory = 2048
  container_definitions = jsonencode([
    {
        name = var.cont_name
        image = var.image
        cpu = var.cpu
        memory = var.memory
        essential = true
        portMappings = [
            {
                containerPort = 80
                hostPort = 80
            }
        ]
    }
  ]) 
}