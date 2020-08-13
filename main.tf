# Create an arbitrary local resource
provider "ibm" {  
  #ibmcloud_api_key = var.ibmcloud_api_key
  #generation = local.generation
  version    = "== 1.5.3"
}

data "template_file" "test" {
  template = "Hello, I am a template. My sample_var value = $${sample_var}"

  vars {
    sample_var = "${var.x}"
  }
}

resource "null_resource" "sleep" {
  triggers {
    uuid = "${uuid()}"
  }

  provisioner "local-exec" {
    command = "sleep ${var.sleepy_time}"
  }
}
