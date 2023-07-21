output "efs_id" {
  description = "The ID of the EFS File System."
  value       = aws_efs_file_system.efs.id
}

output "efs_ap_id" {
  description = "The ID of the EFS Access Point."
  value       = aws_efs_access_point.efs_ap.id
}

output "security_group_id" {
  description = "The ID of the security group."
  value       = aws_security_group.sg.id
}
