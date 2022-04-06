resource "yandex_compute_instance" "logstash" {
name        = "logstash-node-01"
platform_id = var.yc_platform_id
zone        = var.yc_zone
hostname = "logstash-node-01"

  resources {
    core_fraction = 20
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.yc_image_id

    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    ip_address = var.yc_instances_sn["logstash-node-01"]
    nat       = "true"
  }

  metadata = {
    user-data = file("${path.module}/cloud_config.yaml")
  }

  scheduling_policy {
    preemptible = true
  }
}
