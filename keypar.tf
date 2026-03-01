resource "aws_key_pair" "grotrack_key" {
  key_name   = "grotrack-key"
  public_key = file("~/.ssh/id_rsa.pub")
}