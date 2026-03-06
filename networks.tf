# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.grotrack_vpc.id
}

# Elastic IP
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

# NAT Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_zb.id
  depends_on    = [aws_internet_gateway.igw]
}

# Public Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.grotrack_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# Private Route Table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.grotrack_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
}

# Associations
resource "aws_route_table_association" "public_zb_assoc" {
  subnet_id      = aws_subnet.public_zb.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_zc_assoc" {
  subnet_id      = aws_subnet.public_zc.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.private_za.id
  route_table_id = aws_route_table.private_rt.id
}