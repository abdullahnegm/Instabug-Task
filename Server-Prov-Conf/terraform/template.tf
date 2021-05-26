resource "aws_instance" "myinstance" {
    ami           = lookup(var.AMIS, var.REGION)
    instance_type = "t2.micro"
    key_name      = var.key_name

    tags = {
        Name      = "DevOps Task"
    }
}

data "template_file" "my-temp" {
  template       = file("./inventory_template")

  vars = {
    instance_ip = aws_instance.myinstance.public_ip
    private_key = var.key_path
  }
}

resource "local_file" "inventory" {
    content  = data.template_file.my-temp.rendered
    filename = var.inventory_path
}
