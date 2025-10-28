data "aws_vpc" "main" {
  filter {
    name   = "tag:InfraEnvironment"
    values = ["${var.infra_environment}"]
  }
}


data "aws_subnets" "public" {
  filter {
    name   = "tag:InfraEnvironment"
    values = ["${var.infra_environment}"]
  }

  filter {
    name   = "tag:Visibility"
    values = ["public"]
  }
}

data "aws_subnet" "public" {
  for_each = toset(data.aws_subnets.public.ids)
  id       = each.value
}


data "aws_subnets" "private" {
  filter {
    name   = "tag:InfraEnvironment"
    values = ["${var.infra_environment}"]
  }

  filter {
    name   = "tag:Visibility"
    values = ["private"]
  }
}

data "aws_subnet" "private" {
  for_each = toset(data.aws_subnets.private.ids)
  id       = each.value
}
