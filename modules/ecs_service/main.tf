resource "aws_ecs_service" "svc" {
  name = var.name
  cluster = var.clust_id
  task_definition = var.task_def_arn
  launch_type = var.launch_type
  desired_count = var.desired_count
  network_configuration {
    subnets = [var.subnet1, var.subnet2]
    assign_public_ip = var.assign_public_ip
    security_groups = [ var.sg_id ]
  }
}