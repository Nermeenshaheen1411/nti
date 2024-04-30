resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  

  tags = {
    Name = "main"
  }
  enable_dns_support = true  # This enables DNS resolution
  enable_dns_hostnames = true  # This allows DNS hostnames
}