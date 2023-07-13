output "vpc_id" {
  value = aws_vpc.vpc_1.id
}

output "web_tier_subnet_ids" {
  value = aws_subnet.web.*.id
}

output "bussines_tier_subnet_ids" {
  value = aws_subnet.bussiness.*.id
}

output "data_tier_subnet_ids" {
  value = aws_subnet.database.*.id
}
