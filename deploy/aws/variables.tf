variable "app_environment" {
  type = string
}

variable "app_version" {
  type = string
}

variable "app_repo" {
  type = string
}

variable "infra_environment" {
  type = string
}

variable "base_alb_listener_rule_priority" {
  type = number
}

variable "az_use_count" {
  type    = number
}
