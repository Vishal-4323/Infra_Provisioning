resource "aws_subnet" "my_subnet" {
  vpc_id = var.vpc_id
  cidr_block = var.cidr_block
}