resource "aws_key_pair" "grotrack_key" {
  key_name   = "key-grotrack"
  public_key = file("key-grotrack.pub")
}