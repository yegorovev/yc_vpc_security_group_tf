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
}

resource "yandex_vpc_security_group_rule" "sgr_egress" {
  count = try(length(var.egress) ,0)

  security_group_binding = yandex_vpc_security_group.sg.id
      direction = "egress"
      protocol = var.egress[count.index].protocol
      from_port = try(var.egress[count.index].from_port, -1)
      port = try(var.egress[count.index].port, -1)
      to_port = try(var.egress[count.index].to_port, -1)
      v4_cidr_blocks =try(var.egress[count.index].v4_cidr_blocks,[])
      security_group_id = try(var.egress[count.index].security_group_id, -1)
      predefined_target = try(var.egress[count.index].predefined_target, null)
      labels            = {}
}

resource "yandex_vpc_security_group_rule" "sgr_ingres" {
  count = try(length(var.ingress) ,0)

  security_group_binding = yandex_vpc_security_group.sg.id
      direction = "ingress"
      protocol = var.ingress[count.index].protocol
      from_port = try(var.ingress[count.index].from_port, -1)
      port = try(var.ingress[count.index].port, -1)
      to_port = try(var.ingress[count.index].to_port, -1)
      v4_cidr_blocks =try(var.ingress[count.index].v4_cidr_blocks,[])
      security_group_id = try(var.ingress[count.index].security_group_id, -1)
      predefined_target = try(var.ingress[count.index].predefined_target, null)
      labels            = {}
}