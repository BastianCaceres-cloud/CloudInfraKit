provider "aws" {
  region = var.region
}

resource "aws_efs_file_system" "efs" {
  creation_token = var.creation_token
  encrypted     = true
  performance_mode = "generalPurpose"
  throughput_mode = "bursting"

  tags = {
    Name = var.volume_name
  }
}

resource "aws_efs_access_point" "efs_ap" {
  file_system_id = aws_efs_file_system.efs.id
  posix_user {
    gid = var.posix_user_gid
    uid = var.posix_user_uid
  }

  root_directory {
    path = var.root_directory_path
    creation_info {
      owner_gid   = var.creation_info_owner_gid
      owner_uid   = var.creation_info_owner_uid
      permissions = var.creation_info_permissions
    }
  }
}

resource "aws_security_group" "sg" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = [var.cidr_block]
  }
}

resource "aws_efs_mount_target" "efs_mt" {
  count           = length(var.subnet_ids)
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = element(var.subnet_ids, count.index)
  security_groups = [aws_security_group.sg.id]
}
