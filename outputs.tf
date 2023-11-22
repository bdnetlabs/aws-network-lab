output "ansible_instance_public_ip" {
  description = "Public IP Address of Ansible Instance"
  value       = module.ansible-instance[*].public_ip
}