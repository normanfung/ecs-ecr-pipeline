output "cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "service_name" {
  value = aws_ecs_service.app_service.name
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

# data "aws_network_interface" "fargate_task_eni" {
#   filter {
#     name   = "group-id"
#     values = [aws_security_group.ecs.id]
#   }

#   filter {
#     name   = "subnet-id"
#     values = [aws_subnet.public[0].id]
#   }

#   depends_on = [aws_ecs_service.app_service]
# }

# output "fargate_task_public_ip" {
#   value = data.aws_network_interface.fargate_task_eni.association[0].public_ip
# }
