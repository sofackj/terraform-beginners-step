resource "aws_lb" "lb" {
  name               = local.elb_sg_name
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sgpublb.id]
  subnets            = [for subnet in var.elb_subnets : subnet.id]

  tags = {
    "Name" = local.elb_sg_name
  }
}

resource "aws_lb_target_group" "tg" {
  name     = "nuumfactory-${var.environment}-tg-${var.digit}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc

  tags = {
    "Name" = "nuumfactory-${var.environment}-tg-${var.digit}"
  }
}

resource "aws_lb_target_group_attachment" "tga" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.appserver.id
  port             = 80

  tags = {
    "Name" = "${self.name}"
  }
}

resource "aws_lb_listener" "lbl" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}