data "aws_lb" "alb" {
  name = "${var.infra_environment}-alb"
}

data "aws_lb_listener" "api_requests" {
  load_balancer_arn = data.aws_lb.alb.arn
  port              = 80
}
