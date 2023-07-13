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
