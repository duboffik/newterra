rg_name           = "cmtr-927242a5-mod4-rg"
vnet_name         = "cmtr-927242a5-mod4-vnet"
subnet_name       = "frontend"
nic_name          = "cmtr-927242a5-mod4-nic"
nsg_name          = "cmtr-927242a5-mod4-nsg"
nsg_rule_http     = "cmtr-80"
nsg_rule_ssh      = "cmtr-22"
public_ip         = "cmtr-927242a5-mod4-publicip"
vm_name           = "cmtr-927242a5-mod4-vm"
domain_name_label = "cmtr-927242a5-mod4-nginx"
linux_username    = "ddubovik"
vm_size           = "Standard_F2s_v2"
rg_location       = "eastus"
vnet_address      = "10.0.0.0/16"
subnet_prefixes   = "10.0.1.0/24"
image_SKU         = "22_04-lts-gen2"
my_conf_name      = "my_nic_configuration"
ext_name          = "my_ext"
sa_type           = "Standard_LRS"
my_disk_name      = "my_disk_name"
tags = {
  Creator = "dzmitry_dubovik@epam.com"
}
