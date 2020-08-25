resource "aws_instance" "web"
{
ami = "${lookup(var.AMIS,var.AWS_REGION)}"
instance_type = "t2.micro"
key_name = "${aws_key_pair.firstkey.key_name}"
tags = {
Name = "First-terra-launch"
}
provisioner "file" 
{
source = "web.sh"
destination = "/tmp/web.sh"
}
provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh",
    ]
  }
 connection
 {
 user = "$(var.user)"
 private_key = "${file(var.PRIVATE_KEY_PATH)}"
}
}
resource "aws_key_pair" "firstkey"
{
key_name = "firstnaveen"
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAgfOF52Dpt88EaLgkFvTZ6Uzd2k3qf3WCNEPpb+1oSmjFwbGlZlQvcNax7WdWk8SXZ+9ToapMvFj3T7ZenCeKfSFs8QvHBM/xwEaexZs7DZt/WcogdeMwhDhZwhp5irUQKkqmjHhlCBXbIpKhKnfuKAuquHd/zbzArOE0TIzWlY1vKOUj3gMX1iGIBpcMbXYLVvpSkgwvnh9Fs8yxrLYE6Dtxum0fHZWNe+qptL4x0rtGNkMeMU7Dre86geQdf1soXwJ181j+AmeDelLHcfwkgPZtduO/rWxOrVSRgf3x5KCackxSnAooC11a5jF9Rp2K1PiA3VALGQWU5MJBc2A4ww== rsa-key-20200820"
}
output "ip"
{
value = "${aws_instance.web.public_ip}"
}
