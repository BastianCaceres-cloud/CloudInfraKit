module "msk" {
  source = "path-to-this-module"

  region = "us-west-2"
  cluster_name = "my-msk-cluster"
  kafka_version = "2.2.1"
  number_of_broker_nodes = 3
  instance_type = "kafka.m5.large"
  client_subnets = ["subnet-abcde012", "subnet-bcde012a", "subnet-fghi345a"]
  security_groups = ["sg-abcde012"]
  volume_size = 1000
}

