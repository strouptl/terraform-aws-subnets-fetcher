# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc
variable "vpc_id" {
  type = string
  default = ""
}

data "aws_vpc" "default" {
  default = true
}

data "aws_vpc" "selected" {
  id = (var.vpc_id == "" ? data.aws_vpc.default.id : var.vpc_id)
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets
data "aws_subnets" "selected" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

data "aws_subnet" "selected" {
  for_each = toset(data.aws_subnets.selected.ids)
  id       = each.value
}

output "ids" {
  value = [for subnet in data.aws_subnet.selected : subnet.id]
}
