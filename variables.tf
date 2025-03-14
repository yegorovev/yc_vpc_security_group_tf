variable "network_id" {
  description = "The id of target security group which rule belongs to"
  type        = string
  nullable    = false
}


variable "name" {
  description = "The id of target security group which rule belongs to"
  type        = string
  nullable    = false
}

variable "ingress" {
  description = "A list of ingress rules"
  type        = list(object({
    protocol = string
    from_port = optional(number)
    port = optional(number)
    to_port = optional(number)
    v4_cidr_blocks = optional(list(string))
    security_group_id = optional(string)
    predefined_target = optional(string)
  }))
  nullable    = true
  default     = []
}

variable "egress" {
  description = "A list of egress rules"
  type        = list(object({
    protocol = string
    from_port = optional(number)
    port = optional(number)
    to_port = optional(number)
    v4_cidr_blocks = optional(list(string))
    security_group_id = optional(string)
    predefined_target = optional(string)
  }))
  nullable    = true
  default     = []
}