# Create a security group for subsequent use by services to allow traffic ingress and access to the NAT gateway
resource "aws_security_group" "service" {
  name        = "${var.app_environment}-sg-service"
  description = "Security group for ECS services running on Fargate"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "${var.app_environment}-sg-service"
    Environment = "${var.app_environment}"
    Category    = "application"
    Version     = "${var.iac_version}"
  }
}

resource "aws_vpc_security_group_ingress_rule" "api_requests" {
  count             = length(data.aws_subnet.public)
  security_group_id = aws_security_group.service.id
  cidr_ipv4         = data.aws_subnet.public[count.index].cidr_block
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080

  tags = {
    Name        = "${var.app_environment}-sg-ingress-rule-service-traffic-${count.index}"
    Environment = "${var.app_environment}"
    Category    = "application"
    Version     = "${var.iac_version}"
  }
}

resource "aws_vpc_security_group_ingress_rule" "service_management" {
  count             = length(data.aws_subnet.public)
  security_group_id = aws_security_group.service.id
  cidr_ipv4         = data.aws_subnet.public[count.index].cidr_block
  from_port         = 9080
  ip_protocol       = "tcp"
  to_port           = 9080

  tags = {
    Name        = "${var.app_environment}-sg-ingress-rule-service-management-${count.index}"
    Environment = "${var.app_environment}"
    Category    = "application"
    Version     = "${var.iac_version}"
  }
}

resource "aws_vpc_security_group_egress_rule" "service" {
  security_group_id = aws_security_group.service.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports

  tags = {
    Name        = "${var.app_environment}-sg-egress-rule-service"
    Environment = "${var.app_environment}"
    Category    = "application"
    Version     = "${var.iac_version}"
  }
}
