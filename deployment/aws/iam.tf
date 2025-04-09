data "aws_iam_role" "ecs_task_exec" {
  name = "${var.infra_environment}-iam-role-ecs-task-exec"
}

data "aws_iam_role" "ecs_task" {
  name = "${var.infra_environment}-iam-role-ecs-task"
}
