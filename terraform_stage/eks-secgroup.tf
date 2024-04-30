resource "aws_security_group" "eks_cluster" {
  name   = "eks-cluster-sg"
  vpc_id = aws_vpc.main.id  

  # Allow inbound traffic for Kubernetes API server (port 443)
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    description = "Allow inbound traffic for Kubernetes API server"
    cidr_blocks = ["0.0.0.0/0"]  
  }

  # Allow outbound traffic for the EKS cluster
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allows all protocols
    description = "Allow all outbound traffic"
    cidr_blocks = ["0.0.0.0/0"]
  }
}