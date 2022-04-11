resource "yandex_vpc_network" "network-1" {
  name = "elk"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name       = "elk-subnet1"
  zone       = "ru-central1-c"
  network_id = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["10.130.0.0/24"]
}