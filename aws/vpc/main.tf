# VPC and Subnets

resource "aws_vpc" "vpc_1" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true

  tags = merge(var.tags, {
    Name = var.vpc_name
  })
}

resource "aws_subnet" "web" {
  count             = 6
  vpc_id            = aws_vpc.vpc_1.id
  cidr_block        = element(var.web_cidrs, count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = merge(var.tags, {
    Name = element(var.web_tier_subnet_names, count.index)
  })
}

resource "aws_subnet" "bussiness" {
  count             = 6
  vpc_id            = aws_vpc.vpc_1.id
  cidr_block        = element(var.bussiness_cidrs, count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = merge(var.tags, {
    Name = element(var.bussiness_tier_subnet_names, count.index)
  })
}

resource "aws_subnet" "database" {
  count             = 6
  vpc_id            = aws_vpc.vpc_1.id
  cidr_block        = element(var.data_cidrs, count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = merge(var.tags, {
    Name = element(var.data_tier_subnet_names, count.index)
  })
}

locals {
  number_of_nat_gateways = var.enable_nat_gateway ? (var.single_nat_gateway ? 1 : (var.one_nat_gateway_per_az ? length(var.availability_zones) : length(var.web_cidrs))) : 0
}

resource "aws_nat_gateway" "web" {
  count         = local.number_of_nat_gateways
  subnet_id     = element(aws_subnet.web.*.id, count.index)
  allocation_id = aws_eip.nat.*.id[count.index]
}

resource "aws_eip" "nat" {
  count = local.number_of_nat_gateways
  domain   = "vpc"
}

resource "aws_internet_gateway" "igw" {
  count  = var.create_igw ? 1 : 0
  vpc_id = aws_vpc.vpc_1.id

  tags = merge(var.tags, {
    Name = "${var.vpc_name}-igw"
  })
}



resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc_1.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.web[0].id
  }

  tags = merge(var.tags, {
    Name = "public-route-table"
  })
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.web)
  subnet_id      = aws_subnet.web[count.index].id
  route_table_id = aws_route_table.public.id
}

# Para las subredes "bussiness":
resource "aws_route_table_association" "bussiness" {
  count          = length(aws_subnet.bussiness)
  subnet_id      = aws_subnet.bussiness[count.index].id
  route_table_id = aws_route_table.public.id
}

# Para las subredes "database":
resource "aws_route_table_association" "database" {
  count          = length(aws_subnet.database)
  subnet_id      = aws_subnet.database[count.index].id
  route_table_id = aws_route_table.public.id
}

