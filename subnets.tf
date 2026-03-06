# Private - ZA
resource "aws_subnet" "private_za" {
  vpc_id            = aws_vpc.grotrack_vpc.id
  cidr_block        = "10.0.0.0/28"
  availability_zone = "us-east-1a"

  tags = { Name = "private-za" }
}

# Public - ZB
resource "aws_subnet" "public_zb" {
  vpc_id                  = aws_vpc.grotrack_vpc.id
  cidr_block              = "10.0.0.48/28"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = { Name = "public-zb" }
}

# Public - ZC
resource "aws_subnet" "public_zc" {
  vpc_id                  = aws_vpc.grotrack_vpc.id
  cidr_block              = "10.0.0.64/28"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = { Name = "public-zc" }
}