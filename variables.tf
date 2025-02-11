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

variable "ingress" {
  description = "A list of ingress rules"
  type        = list(object({
    protocol = string
    port = number
    v4_cidr_blocks = list(string)
  }))
  nullable    = true
  default     = []
}

variable "egress" {
  description = "A list of egress rules"
  type        = list(object({
    protocol = string
    port = number
    v4_cidr_blocks = list(string)
  }))
  nullable    = true
  default     = []
}