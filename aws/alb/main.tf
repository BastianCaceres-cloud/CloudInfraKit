resource "aws_lb" "this" {
  name               = var.lb_name
  internal           = var.internal
  load_balancer_type = "application"
  subnets            = var.subnets
  security_groups    = var.security_groups
  tags               = var.tags
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = var.listener_port
  protocol          = var.listener_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.default.arn
  }
}

resource "aws_lb_target_group" "default" {
  name     = "${var.lb_name}-default-tg"
  port     = var.target_group_port
  protocol = var.target_group_protocol
  vpc_id   = var.vpc_id
  # health_check {
  #   path     = "/"
  #   port     = "80"
  #   protocol = "HTTP"
  #   matcher  = "200"
  # }  
}


resource "aws_lb_target_group_attachment" "this" {
  for_each = merge(var.target_group_attachments, var.asg_target_group_attachments)

  target_group_arn = aws_lb_target_group.default.arn
  target_id        = each.value.target_id
  port             = each.value.port
}



# Múltiples Target Groups
resource "aws_lb_target_group" "additional" {
  for_each = { for tg in var.additional_target_groups : tg.name => tg }

  name     = each.value.name
  port     = each.value.port
  protocol = each.value.protocol
  vpc_id   = var.vpc_id
}

# Listener HTTPS (opcional)
resource "aws_lb_listener" "https" {
  count = var.https_listener != null ? 1 : 0

  load_balancer_arn = aws_lb.this.arn
  port              = var.https_listener.port
  protocol          = "HTTPS"

#   certificate {
#     certificate_arn = var.https_listener.certificate_arn
#   }

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.default.arn
  }

#   dynamic "action" {
#     for_each = var.https_listener.additional_actions
#     content {
#       type             = action.value.type
#       target_group_arn = action.value.target_group_arn
#     }
#   }
}


locals {
  common_tags = merge(var.tags, { Terraform = "true" })
}

