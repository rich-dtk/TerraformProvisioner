#providers
provider "aws" {
	region = "${var.region}"
}

#resources


#resource "aws_key_pair" "ec2key" {
#  key_name = "publicKey"
#  public_key = "${file(var.public_key_path)}"
#}

resource "aws_instance" "testInstance" {
  ami           = "${var.instance_ami}"
  instance_type = "${var.instance_type}"
  subnet_id = "${var.subnet_id}"
  vpc_security_group_ids = ["${var.security_group_id}"]
  key_name = "${var.key_pair_name}"

  provisioner "remote-exec" {
    inline = [
      "sudo apt -y update",
      "sudo apt -y install nginx",
      "sudo systemctl start nginx",
    ]
  }

  connection {
    host     = "${aws_instance.testInstance.public_ip}"
    type     = "ssh"
    user     = "ubuntu"
    password = ""
    private_key = "${file("/home/ubuntu/.ssh/id_rsa")}"
  }
}
resource "aws_instance" "testInstance2" {
  ami           = "${var.instance_ami}"
  instance_type = "${var.instance_type}"
  subnet_id = "${var.subnet_id}"
  vpc_security_group_ids = ["${var.security_group_id}"]
  key_name = "${var.key_pair_name}"

  provisioner "remote-exec" {
    inline = [
      "sudo apt -y update",
      "sudo apt -y install nginx",
      "sudo systemctl start nginx",
    ]
  }

  connection {
    host     = "${aws_instance.testInstance.public_ip}"
    type     = "ssh"
    user     = "ubuntu"
    password = ""
    private_key = "${file("/home/ubuntu/.ssh/id_rsa")}"
  }

}