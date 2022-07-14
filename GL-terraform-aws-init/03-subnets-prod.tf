resource "aws_subnet" "private-subnet-prod-a" {
  vpc_id            = aws_vpc.vpc-prod.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = "us-east-1a"

  tags = {
    "Name" = "private-subnet-prod-a"
  }
}

resource "aws_subnet" "public-subnet-prod-a" {
  vpc_id                  = aws_vpc.vpc-prod.id
  cidr_block              = "10.0.32.0/19"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "public-subnet-prod-a"
    //allows discovery by load balancer
    "kubernetes.io/role/elb-prod" = "1"
    //allow k8s to operate in subnet
    "kubernetes.io/cluster/eks-cluster-prod" = "shared"
  }
}

resource "aws_subnet" "private-subnet-prod-b" {
  vpc_id            = aws_vpc.vpc-prod.id
  cidr_block        = "10.0.64.0/19"
  availability_zone = "us-east-1b"

  tags = {
    "Name" = "private-subnet-prod-b"
  }
}

resource "aws_subnet" "public-subnet-prod-b" {
  vpc_id                  = aws_vpc.vpc-prod.id
  cidr_block              = "10.0.96.0/19"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "public-subnet-prod-b"
    //allows discovery by load balancer
    "kubernetes.io/role/elb-prod" = "1"
    //allow k8s to operate in the subnet
    "kubernetes.io/cluster/eks-cluster-prod" = "shared"
  }
}

resource "aws_db_subnet_group" "db-subnet-group-prod" {
  name       = "db-subnet-group-prod"
  subnet_ids = [aws_subnet.private-subnet-prod-a.id, aws_subnet.private-subnet-prod-b.id]

  tags = {
    "Name" = "db-subnet-group-prod"
  }
}