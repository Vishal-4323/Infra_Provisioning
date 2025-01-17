variable "name" {
  description = "name of the service"
}

variable "clust_id" {
  description = "cluster id"
}

variable "task_def_arn" {
  description = "task definition arn"
}

variable "subnet1" {
  description = "subnet for network configuration to fargate"
}

variable "subnet2" {
  description = "subnet for network configuration to fargate"
}

variable "launch_type" {
  description = "FARGATE or EC2"
}

variable "desired_count" {
  description = "desired count for replica"
}

variable "assign_public_ip" {
  description = "true or false to assign public ip"
}

variable "sg_id" {
  description = "security group id"
}