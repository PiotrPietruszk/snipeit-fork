resource "aws_route_table" "private-routing-table-prod-a" {
  vpc_id = aws_vpc.vpc-prod.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      nat_gateway_id             = aws_nat_gateway.nat-prod.id
      carrier_gateway_id         = ""
      core_network_arn           = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = ""
      instance_id                = ""
      ipv6_cidr_block            = null
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    }
  ]

  tags = {
    Name = "private-routing-table-prod-a"
  }
}

resource "aws_route_table" "public-routing-table-prod-a" {
  vpc_id = aws_vpc.vpc-prod.id
  route = [{
    cidr_block                 = "0.0.0.0/0"
    gateway_id                 = aws_internet_gateway.igw-prod.id
    carrier_gateway_id         = ""
    core_network_arn           = ""
    destination_prefix_list_id = ""
    egress_only_gateway_id     = ""
    instance_id                = ""
    ipv6_cidr_block            = null
    local_gateway_id           = ""
    nat_gateway_id             = ""
    network_interface_id       = ""
    transit_gateway_id         = ""
    vpc_endpoint_id            = ""
    vpc_peering_connection_id  = ""
    }
  ]

  tags = {
    Name = "public-routing-table-prod-a"
  }
}

resource "aws_route_table" "private-routing-table-prod-b" {
  vpc_id = aws_vpc.vpc-prod.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      nat_gateway_id             = aws_nat_gateway.nat-prod.id
      carrier_gateway_id         = ""
      core_network_arn           = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = ""
      instance_id                = ""
      ipv6_cidr_block            = null
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    }
  ]

  tags = {
    Name = "private-routing-table-prod-b"
  }
}

resource "aws_route_table" "public-routing-table-prod-b" {
  vpc_id = aws_vpc.vpc-prod.id
  route = [{
    cidr_block                 = "0.0.0.0/0"
    gateway_id                 = aws_internet_gateway.igw-prod.id
    carrier_gateway_id         = ""
    core_network_arn           = ""
    destination_prefix_list_id = ""
    egress_only_gateway_id     = ""
    instance_id                = ""
    ipv6_cidr_block            = null
    local_gateway_id           = ""
    nat_gateway_id             = ""
    network_interface_id       = ""
    transit_gateway_id         = ""
    vpc_endpoint_id            = ""
    vpc_peering_connection_id  = ""
    }
  ]

  tags = {
    Name = "public-routing-table-prod-b"
  }
}


resource "aws_route_table_association" "private-association-prod-a" {
  subnet_id      = aws_subnet.private-subnet-prod-a.id
  route_table_id = aws_route_table.private-routing-table-prod-a.id
}

resource "aws_route_table_association" "private-association-prod-b" {
  subnet_id      = aws_subnet.private-subnet-prod-b.id
  route_table_id = aws_route_table.private-routing-table-prod-b.id
}

resource "aws_route_table_association" "public-association-prod-a" {
  subnet_id      = aws_subnet.public-subnet-prod-a.id
  route_table_id = aws_route_table.public-routing-table-prod-a.id
}

resource "aws_route_table_association" "public-association-prod-b" {
  subnet_id      = aws_subnet.public-subnet-prod-b.id
  route_table_id = aws_route_table.public-routing-table-prod-b.id
}