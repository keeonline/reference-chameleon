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
    Environment = "${var.app_environment}"
    Category    = "application"
    Version     = "${var.app_version}"
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
    unhealthy_threshold = 2
    interval            = 30
    matcher             = "200"
    path                = "/bravo/actuator/health"
    port                = 9080
    protocol            = "HTTP"
  }

  tags = {
    Name        = "${var.app_environment}-tg-bravo"
    Environment = "${var.app_environment}"
    Category    = "application"
    Version     = "${var.app_version}"
  }

}

resource "aws_lb_listener_rule" "bravo" {
  listener_arn = data.aws_lb_listener.api_requests.arn
  priority     = 20

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.bravo.arn
  }

  condition {
    path_pattern {
      values = ["/bravo/*"]
    }
  }

  tags = {
    Name        = "${var.app_environment}-alb-listener-rule-bravo"
    Environment = "${var.app_environment}"
    Category    = "application"
    Version     = "${var.app_version}"
  }
}

resource "aws_ecs_service" "bravo" {
  name            = "${var.app_environment}-ecs-service-bravo"
  cluster         = data.aws_ecs_cluster.applications.id
  task_definition = aws_ecs_task_definition.bravo.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  load_balancer {
    target_group_arn = aws_lb_target_group.bravo.arn
    container_name   = "${var.app_environment}-task-bravo"
    container_port   = 8080
  }

  network_configuration {
    security_groups  = [aws_security_group.service.id]
    subnets          = data.aws_subnets.private.ids
    assign_public_ip = false
  }

  tags = {
    Name        = "${var.app_environment}-ecs-service-bravo"
    Environment = "${var.app_environment}"
    Category    = "application"
    Version     = "${var.app_version}"
  }
}
