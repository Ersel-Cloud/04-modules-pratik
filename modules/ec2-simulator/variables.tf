variable "instance_type" {
  description = "EC2 sunucu tipi (Ornegin: t3.micro veya t3.medium)"
  type        = string
  default     = "t3.micro"
}

variable "environment_name" {
  description = "Ortam adi (dev, prod vb.)"
  type        = string
}

variable "allowed_ssh_cidr" {
type        = string
description = "SSH için izin verilen CIDR (örnek: 1.2.3.4/32)"
}

variable "server_count" {
  description = "Ortamda acilacak sunucu sayisi"
  type        = number
  default     = 1
}

variable "server_configs" {
  description = "Sunucu konfigurasyonlari haritasi"
  type = map(object({
    instance_type = string
  }))
  default = {
    web = { instance_type = "t3.micro" }
  }
}
