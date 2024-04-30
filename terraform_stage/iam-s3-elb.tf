# IAM policy to allow ELB to write to the S3 bucket
resource "aws_iam_policy" "elb_access_logs_policy" {
  name        = "ELBAccessLogsPolicy"
  description = "Policy to allow ELB to write access logs to S3"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["s3:PutObject"],
        Resource = "${aws_s3_bucket.elb_logs.arn}/*",
      },
    ],
  })
}

# IAM role for the ELB to assume with the above policy attached
resource "aws_iam_role" "elb_role" {
  name = "ELBRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = {
          Service = "elasticloadbalancing.amazonaws.com"
        },
        Action = "sts:AssumeRole",
      },
    ],
  })
}

resource "aws_iam_role_policy_attachment" "attach_elb_policy" {
  policy_arn = aws_iam_policy.elb_access_logs_policy.arn
  role       = aws_iam_role.elb_role.name
}
