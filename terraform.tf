
resource "template_dir" "prepare_local_whitecloud_config" {
  source_dir = "etc/whitecloud/"
  destination_dir = "/tmp/whitecloud/"
  vars = {
    controlAsCompute = var.controlAsCompute
  }
}

resource "null_resource" "prepare_deployer_for_whitecloud" {
    provisioner "local-exec" {
        command = "sudo cp -r inventory.yml inventory-copy.yml"
        
    }
}

variable controlAsCompute {
    type = string
    default = "false"
}