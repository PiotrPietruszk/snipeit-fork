resource "aws_vpc" "vpc-prod" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-prod"
  }
}
resource "aws_internet_gateway" "igw-prod" {
  vpc_id = aws_vpc.vpc-prod.id

  tags = {
    Name = "igw-prod"
  }
}

resource "aws_eip" "nat-ip" {
  vpc = true

  tags = {
    Name = "nat-ip"
  }
}

resource "aws_nat_gateway" "nat-prod" {
  allocation_id = aws_eip.nat-ip.id
  subnet_id     = aws_subnet.public-subnet-prod-a.id

  tags = {
    Name = "nat"
  }

  depends_on = [aws_internet_gateway.igw-prod]
}
