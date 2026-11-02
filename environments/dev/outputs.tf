output "dev_server_id" {
    value = module.dev_server.server_ids
}

output "dev_environment" {
    value = module.dev_server.environment_info
}

output "all_server_ids" {
    value = module.dev_server.server_ids # (prod ortamında prod_server.server_ids olucak)
}
