/*****************
 * Configuration *
******************/
/* NB: If this number changes from 3, the section resource "openstack_networking_port_v2" "whitemist_ports" in main.tf must be updated to */
variable amountsIpsWhiteMist{
  type = number
  default = 3
}

variable amountsIpsNotWhiteMist{
  type = number
  default = 1
}

/* Total amount of nodes to be created */
variable amountNodes {
  type = number
  default = 1
}

/* Amount of admin nodes to be created */
variable amountAdminNodes {
  type = number
  default = 1
}

/* Obtain imageName from command-line */
variable imageName {
  type = string
  default = "Ubuntu 20.04 LTS"
}

variable nodeFlavour {
  type = string
  default = "m1.medium"
}

/* Obtain project id from command-line */
variable projectId {
  type = string
}

/* Obtain project id from command-line */
variable modulePicker {
  type = number
}

variable prefix {
  type = string
  default = ""
}

/* SSH timeout */
variable timeout {
  type = number
  default = 120
}
 
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