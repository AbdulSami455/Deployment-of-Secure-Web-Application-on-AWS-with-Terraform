resource "aws_launch_configuration" "example" {
  name          = "example-launch-config"
  image_id      = "ami-12345678"  # Replace with your AMI ID
  instance_type = "t2.micro"       # Replace with your instance type
  key_name      = "your-key-pair"  # Replace with your key pair
  security_groups = [aws_security_group.allow_tls.id]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "example" {
  name                 = "example-autoscaling-group"
  launch_configuration = aws_launch_configuration.example.name
  min_size             = 1
  max_size             = 5
  desired_capacity     = 2
  vpc_zone_identifier  = [aws_subnet.main.id]  # Replace with your subnet ID(s)

  target_group_arns = [
    aws_lb_target_group.example.arn
  ]

  tag {
    key                 = "Name"
    value               = "example-autoscaling-group"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "example" {
  name                   = "example-autoscaling-policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.example.name
}
