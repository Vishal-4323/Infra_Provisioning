module "vpc" {
  source = "./modules/vpc"
  cidr_block = var.cidr_block
  VPCName = var.VPCName
}

module "subnet1" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  cidr_block = var.sub1_cidr_block
}

module "subnet2" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  cidr_block = var.sub2_cidr_block
}

module "sg" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "sg_in_rule" {
  source = "./modules/sg_inbound_rule"
  security_group_id = module.sg.sg_id
  from_port = 80
  to_port = 80
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
}

module "sg_out_rule" {
  source = "./modules/sg_outbound_rule"
  security_group_id = module.sg.sg_id
  ip_protocol = -1
  cidr_ipv4 = "0.0.0.0/0"
}

module "ecs-cluster" {
  source = "./modules/ecs_cluster"
  name = "test-cluster"
}

module "ecr" {
  source = "./modules/ecr_repo"
  name = "my-repo"
  scan_on_push = true
}

module "ecs-task-def" {
  source = "./modules/ecs_task_definition"
  family = "my-task-def"
  requ_comp = "FARGATE"
  cont_name = "test"
  image = "nginx:latest"
  cpu = 1024
  memory = 2048
}

module "svc" {
  source = "./modules/ecs_service"
  name = "mysvc"
  launch_type = "FARGATE"
  desired_count = 1
  assign_public_ip = true
  clust_id = module.ecs-cluster.clust_id
  task_def_arn = module.ecs-task-def.task_def_arn
  subnet1 = "subnet-00c5636a2ec49c305"
  subnet2 = "subnet-0e865ec2da7b5bc80"
  sg_id = "sg-0efb02ab0dc9c6764"
}