resource "aws_ecs_task_definition" "alpha" {
  family                   = "${var.app_environment}-family-alpha"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = data.aws_iam_role.ecs_task_exec.arn
  # task_role_arn            = data.aws_iam_role.ecs_task.arn

  container_definitions = jsonencode([
    {
      name  = "${var.app_environment}-task-alpha"
      image = "docker.io/keeonline/chameleon:${var.app_version}"
      environment = [
        { "name" : "SERVICE_NAME", "value" : "alpha" },
        { "name" : "APP_ENV", "value" : "${var.app_environment}" },
      ]
      cpu       = 256
      memory    = 512
#      essential = true
      portMappings = [
        {
          containerPort = 8080
          protocol      = "tcp"
        }
        {
          containerPort = 9080
          protocol      = "tcp"
        }
      ]
    }
  ])

  tags = {
    Name        = "${var.app_environment}-task-alpha"
  }
}

resource "aws_lb_target_group" "alpha" {
  name                 = "${var.app_environment}-tg-alpha"
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
    path                = "/${var.app_environment}/alpha/actuator/health"
    port                = 9080
    protocol            = "HTTP"
  }

  tags = {
    Name        = "${var.app_environment}-tg-alpha"
  }
}

resource "aws_lb_listener_rule" "alpha" {
  listener_arn = data.aws_lb_listener.api_requests.arn
  priority     = var.base_alb_listener_rule_priority+1

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alpha.arn
  }

  condition {
    path_pattern {
      values = ["/${var.app_environment}/alpha/*"]
    }
  }

  tags = {
    Name        = "${var.app_environment}-alb-listener-rule-alpha"
  }
}

resource "aws_ecs_service" "alpha" {
  depends_on = [data.aws_subnets.private]

  name            = "${var.app_environment}-ecs-service-alpha"
  cluster         = data.aws_ecs_cluster.applications.id
  task_definition = aws_ecs_task_definition.alpha.arn
  desired_count   = var.az_use_count
  launch_type     = "FARGATE"

  load_balancer {
    target_group_arn = aws_lb_target_group.alpha.arn
    container_name   = "${var.app_environment}-task-alpha"
    container_port   = 8080
  }

  network_configuration {
    security_groups  = [data.aws_security_group.app_services.id]
    subnets          = data.aws_subnets.private.ids
    assign_public_ip = false
  }

  tags = {
    Name        = "${var.app_environment}-ecs-service-alpha"
  }
}
