data "aws_ecs_cluster" "applications" {
  cluster_name = "${var.infra_environment}-ecs-cluster-applications"
}

data "aws_security_group" "app_services" {
  name        = "${var.infra_environment}-sg-app-services"
}
