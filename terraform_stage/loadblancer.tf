#resource "aws_lb" "app" {
  #name               = "load-balancer"
  #load_balancer_type = "application"
  #internal           = false  # Set to true if it's for internal use
  #security_groups    = [ aws_security_group.elb_sg.id ]
  #subnets            = [ aws_subnet.public_us_east_2a.id , aws_subnet.private_us_east_2a.id ]

  # Configure access logs
  #access_logs {
    #bucket = aws_s3_bucket.access_logs_bucket.id  # The S3 bucket for access logs
    #prefix = "elb-logs"  #  prefix to organize logs
  #}
#}