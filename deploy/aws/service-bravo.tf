resource "aws_ecs_task_definition" "bravo" {
  family                   = "${var.app_environment}-family-bravo"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = data.aws_iam_role.ecs_task_exec.arn
  task_role_arn            = data.aws_iam_role.ecs_task.arn

  container_definitions = jsonencode([
    {
      name  = "${var.app_environment}-task-bravo"
      image = "docker.io/keeonline/chameleon:${var.app_version}"
      environment = [
        { "name" : "SERVICE_NAME", "value" : "bravo" },
        { "name" : "APP_ENV", "value" : "${var.app_environment}" },
      ]
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
          protocol      = "tcp"
        }
      ]
    }
  ])

  tags = {
    Name        = "${var.app_environment}-task-bravo"
  }
}

resource "aws_lb_target_group" "bravo" {
  name                 = "${var.app_environment}-tg-bravo"
  port                 = 8080
  protocol             = "HTTP"
  vpc_id               = data.aws_vpc.main.id
  deregistration_delay = 5
  target_type          = "ip"

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 3
    interval            = 10
    matcher             = "200"
    path                = "/${var.app_environment}/bravo/actuator/health"
    port                = 9080
    protocol            = "HTTP"
  }

  tags = {
    Name        = "${var.app_environment}-tg-bravo"
  }

}

resource "aws_lb_listener_rule" "bravo" {
  listener_arn = data.aws_lb_listener.api_requests.arn
  priority     = var.base_alb_listener_rule_priority+2

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.bravo.arn
  }

  condition {
    path_pattern {
      values = ["/${var.app_environment}/bravo/*"]
    }
  }

  tags = {
    Name        = "${var.app_environment}-alb-listener-rule-bravo"
  }
}

resource "aws_ecs_service" "bravo" {
  name            = "${var.app_environment}-ecs-service-bravo"
  cluster         = data.aws_ecs_cluster.applications.id
  task_definition = aws_ecs_task_definition.bravo.arn
  desired_count   = var.az_use_count
  launch_type     = "FARGATE"

  load_balancer {
    target_group_arn = aws_lb_target_group.bravo.arn
    container_name   = "${var.app_environment}-task-bravo"
    container_port   = 8080
  }

  network_configuration {
    security_groups  = [data.aws_security_group.app_services.id]
    subnets          = data.aws_subnets.private.ids
    assign_public_ip = false
  }

  tags = {
    Name        = "${var.app_environment}-ecs-service-bravo"
  }
}
