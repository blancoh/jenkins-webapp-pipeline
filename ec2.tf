resource "aws_key_pair" "auth" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_launch_configuration" "autoscale_web" {
  name_prefix     = "webserver-"
  #image_id        = var.aws_amis[var.aws_region]
  image_id       = "ami-02aedf246b2c43e91"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.sec_web.id]
  key_name        = aws_key_pair.auth.id

#  associate_public_ip_address = true
  user_data = <<-EOF
    #!/bin/bash
    #sudo apt-get -y update
    #sudo apt-get -y remove docker docker-engine docker.io containerd runc
    #sudo apt-get -y install apt-transport-https ca-certificates curl gnupg lsb-release
    #curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    #echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    #sudo apt-get -y update
    #sudo apt-get -y install docker-ce docker-ce-cli containerd.io              
    docker run -it --rm -d -p 80:80 --name web nginx
EOF


  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "autoscale_group" {
  name                 = "terraform-asg-001"
  launch_configuration = aws_launch_configuration.autoscale_web.id
  vpc_zone_identifier  = [aws_subnet.PrivateSubnetA.id, aws_subnet.PrivateSubnetB.id, aws_subnet.PrivateSubnetC.id]
  target_group_arns    = [aws_lb_target_group.nlb_target_group.arn]

  #  load_balancers = ["${aws_elb.elb.name}"]
  min_size                  = 3
  max_size                  = 3
  health_check_grace_period = 60
  health_check_type         = "ELB"
  desired_capacity          = 3
  tag {
    key                 = "Name"
    value               = "webserver-autoscale"
    propagate_at_launch = true
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "sec_web" {
  name        = "sec_web"
  description = "Used for autoscale group"
  vpc_id      = aws_vpc.default.id

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "sec_lb" {
  name   = "sec_elb"
  vpc_id = aws_vpc.default.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

