output "prod_server_ids" {
    value = module.prod_server.server_ids
}

output "prod_environment" {
    value = module.prod_server.environment_info
}

output "all_server_ids" {
    value = module.prod_server.environment_info
}
