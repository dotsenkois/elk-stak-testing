resource "local_file" "inventory" {
  content = <<-DOC
    # Ansible inventory containing variable values from Terraform.
    # Generated by Terraform.

---
all:
  hosts:
    elastic-node-01:
      ansible_host: ${yandex_compute_instance.elastic.network_interface.0.nat_ip_address}
    kibana-node-01:
      ansible_host: ${yandex_compute_instance.kibana.network_interface.0.nat_ip_address}
    logstash-node-01:
      ansible_host: ${yandex_compute_instance.logstash.network_interface.0.nat_ip_address}
    nexus-node-01:
      ansible_host: ${yandex_compute_instance.nexus.network_interface.0.nat_ip_address}

  
  children:
    elk-stack:
      children:
        elastic:
          hosts:
            elastic-node-01:
        kibana:
          hosts:
            kibana-node-01:
        logstash:
          hosts:
            logstash-node-01:
    infrastructure:
          hosts:
            nexus-node-01:
      
  vars:
    ansible_connection_type: paramiko
    ansible_user: dotsenkois
    DOC
  filename = "../playbook/inventory/prod/hosts.yml"
  

  depends_on = [
    yandex_compute_instance.elastic,
    yandex_compute_instance.kibana,
    yandex_compute_instance.logstash,
    yandex_compute_instance.nexus
  ]
}
