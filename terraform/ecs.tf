data "aws_ecs_cluster" "applications" {
  cluster_name = "${var.infra_environment}-ecs-cluster-applications"
}