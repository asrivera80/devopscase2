# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine
resource "azurerm_linux_virtual_machine" "workerkubernete" {
    name                = "kubeVm-${var.vms_workers[count.index]}"
    count               =   length(var.vms_workers)
    resource_group_name = azurerm_resource_group.gr.name
    location            = azurerm_resource_group.gr.location
    size                = var.vm_size
    admin_username      = "azureuser"
    network_interface_ids = [
        azurerm_network_interface.nic[count.index].id,
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  plan {
    name      = "centos-8-stream-free"
    product   = "centos-8-stream-free"
    publisher = "cognosys"
  }

  source_image_reference {
    publisher = "cognosys"
    offer     = "centos-8-stream-free"
    sku       = "centos-8-stream-free"
    version   = "22.03.28"
  }
  tags = {
    environment = "CP2"
  }
}