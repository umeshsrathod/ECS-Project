output "load_balancer_dns" {
  description = "DNS name of the load balancer for the ECS project"
  value       = aws_lb.ecs-project-lb.dns_name
}
