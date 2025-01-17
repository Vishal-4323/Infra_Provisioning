variable "family" {
  description = "A unique name for your task description"
}

variable "cont_name" {
  description = "name of the container"
}

variable "image" {
  description = "docker img for the container"
}

variable "cpu" {
  description = "Number of cpu units used by the task"
}

variable "memory" {
  description = "Amount (in MiB) of memory used by the task"
}

variable "requ_comp" {
  description = "Set of launch types required by the task. The valid values are EC2 and FARGATE"
}