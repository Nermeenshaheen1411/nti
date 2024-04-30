# Define the S3 bucket for ELB access logs
resource "aws_s3_bucket" "elb_logs" {
  bucket = "s3-elb-access-logs-bucket"
  #acl    = "log-delivery-write"  # Allows ELB to write logs
}
# Set Object Ownership to BucketOwnerEnforced
resource "aws_s3_bucket_ownership_controls" "elb_logs" {
  bucket = aws_s3_bucket.elb_logs.id

  rule {
    object_ownership = "BucketOwnerEnforced"  # Use IAM policies to manage permissions
  }
}

#  Set a lifecycle rule to manage old logs
resource "aws_s3_bucket_lifecycle_configuration" "elb_logs" {
  bucket = aws_s3_bucket.elb_logs.id

  rule {
    id     = "expire-logs"
    status = "Enabled"

    expiration {
      days = 30  # Delete logs older than 30 days
    }
  }
}
# Configure the Application Load Balancer
resource "aws_lb" "lb" {
  name = "load-balancer"

  # Enable access logging
  access_logs {
    bucket = aws_s3_bucket.elb_logs.id
    prefix = "elb-logs/"  #  prefix for the log files in the bucket
  }

  # Additional ELB configuration (e.g., subnets, security groups, etc.)
  subnets        = [aws_subnet.public_us_east_2a.id,aws_subnet.public_us_east_2b.id]
  security_groups = [aws_security_group.elb_sg.id]

  load_balancer_type = "application"
}
