output "bootstrap_brokers" {
  description = "A list of one or more DNS names (or IP) and ports of the Apache Kafka brokers"
  value       = aws_msk_cluster.example.bootstrap_brokers
}