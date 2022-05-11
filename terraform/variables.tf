variable "boot_from_volume" {
    type = bool
    default = true
}

variable "image" {
    type = string
    default = "CentOS-stream8"
}

variable "flavor" {
    type = string
    default = "general.v1.medium"
}

variable "keypair" {
    type = string
    default = "stackhpc-will"
}

variable "network" {
    type = string
    default = "stackhpc-ipv4-geneve"
}

variable "remote_user" {
   type = string
   default = "centos"
}
