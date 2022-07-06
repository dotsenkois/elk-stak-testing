
variable "yc_zone" {
  type    = string
  default = "ru-central1-c"
}

variable "yc_instances_sn" {
  type = map
  default = {
    "elastic-node-01" = "10.130.0.50"
    "kibana-node-01" = "10.130.0.60"
    "logstash-node-01" = "10.130.0.70"
    "nexus-node-01" = "10.130.0.12"
  }
}

variable "yc_platform_id" {
  type = string
  default = "standard-v1"
}
variable "yc_image_id" {
  type = string
  default = "fd8p7vi5c5bbs2s5i67s"
}
