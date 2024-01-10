variable "ec2-resource-configuration" {
 default = "t3.micro"
}

locals {
 number-of-instances=5
}


resource "aws_instance" "multiple-instances" {
  instance_type = var.ec2-resource-configuration
  ami           = "ami-007855ac798b5175e"
  tags = {
    Name = "multiple-${count.index}"
  }
  count = local.number-of-instances
}

output "multiple_IP-addresses"{
 value = aws_instance.multiple-instances.*.public_ip
}
