output "server_ids" {
    description = "Olusturulan tam sunucularin ID'leri"
    value       = { for k, v in aws_instance.module_server : k => v.id }
}

output "environment_info" {
    description = "Hangi ortamda calistirdigimizin bilgisi"
    value       = var.environment_name # Tırnak işaretini değişkenin değerini versin
}

