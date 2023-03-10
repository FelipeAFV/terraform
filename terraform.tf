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
  default = 5
}

/* Amount of admin nodes to be created */
variable amountAdminNodes {
  type = number
  default = 3
}

/* Obtain imageName from command-line */
variable imageName {
  type = string
  default = "Ubuntu 20.04 LTS"
}
variable "ipNodes" {
	type = list(string)
	default = ["123.123.123.123","2.2.2.2", "12.13.32.11","12.13.32.144","12.13.32.5"]
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


resource "template_dir" "prepare_local_whitecloud_config" {
  source_dir = "etc/"
  destination_dir = "etc/copy/"
  vars = {
    controlAsCompute = var.controlAsCompute
    ipNodesString = join(",", var.ipNodes)
    amountAdminNodes = var.amountAdminNodes
    prefix = var.prefix
  }
}

variable controlAsCompute {
    type = bool
    default = false
}