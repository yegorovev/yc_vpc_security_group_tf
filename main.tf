terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    } 
  } 
}

resource "yandex_vpc_security_group" "sg" {
  network_id = var.network_id 
  name   = var.name
  dynamic "ingress" {
    for_each = var.ingress
    content {
      protocol = ingress.value["protocol"]
      port = ingress.value["port"]
      v4_cidr_blocks = ingress.value["v4_cidr_blocks"]
    }
  }
  dynamic "egress" {
    for_each = var.ingress
    content {
      protocol = ingress.value["protocol"]
      port = ingress.value["port"]
      v4_cidr_blocks = ingress.value["v4_cidr_blocks"]
    }
  }
}
