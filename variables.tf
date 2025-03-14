variable "network_id" {
  description = "ID of the network this security group belongs to"
  type        = string
  nullable    = false
}


variable "name" {
  description = "Name of the security group"
  type        = string
  nullable    = false
}

variable "description" {
  description = "Description of the security group"
  type        = string
  nullable    = true
  default     = null
}

variable "ingress" {
  description = "A list of ingress rules"
  type = list(object({
    protocol          = string
    from_port         = optional(number)
    port              = optional(number)
    to_port           = optional(number)
    v4_cidr_blocks    = optional(list(string))
    security_group_id = optional(string)
    predefined_target = optional(string)
  }))
  nullable = true
  default  = []
}

variable "egress" {
  description = "A list of egress rules"
  type = list(object({
    protocol          = string
    from_port         = optional(number)
    port              = optional(number)
    to_port           = optional(number)
    v4_cidr_blocks    = optional(list(string))
    security_group_id = optional(string)
    predefined_target = optional(string)
  }))
  nullable = true
  default  = []
}