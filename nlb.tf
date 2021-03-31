resource "aws_lb" "nlb" {
  name                             = "nlb"
  internal                         = false
  load_balancer_type               = "network"
  subnets                          = [aws_subnet.PublicSubnetA.id, aws_subnet.PublicSubnetB.id, aws_subnet.PublicSubnetC.id]
  enable_cross_zone_load_balancing = true
  tags = {
    Name = "nlb"
  }
}

resource "aws_lb_target_group" "nlb_target_group" {
  name     = "nlb-target-group"
  port     = "80"
  protocol = "TCP"
  vpc_id   = aws_vpc.default.id
  tags = {
    name = "nlb_target_group"
  }
}

resource "aws_autoscaling_attachment" "nlb_autoscale" {
  alb_target_group_arn   = aws_lb_target_group.nlb_target_group.arn
  autoscaling_group_name = aws_autoscaling_group.autoscale_group.id
}

resource "aws_lb_listener" "nlb_listener" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = 80
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.nlb_target_group.arn
    type             = "forward"
  }
}

