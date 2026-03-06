# FRONTEND 1 (ZB)

resource "aws_instance" "frontend_grotrack" {
  ami                    = "ami-0b6c6ebed2801a5cb"
  instance_type          = "t3.small"
  key_name               = aws_key_pair.grotrack_key.key_name
  subnet_id              = aws_subnet.public_zb.id
  # private_ip             = "10.0.0.52"
  vpc_security_group_ids = [
    aws_security_group.frontend_sg.id
  ]

  tags = {
    Name = "frontend-grotrack"
  }

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 20
    volume_type = "gp3"
  }

  user_data = file("scripts/default.sh")
}

# FRONTEND 2 (ZC)

resource "aws_instance" "frontend2_grotrack" {
  ami                    = "ami-0b6c6ebed2801a5cb"
  instance_type          = "t3.small"
  key_name               = aws_key_pair.grotrack_key.key_name
  subnet_id              = aws_subnet.public_zc.id
  # private_ip             = "10.0.0.68"
  vpc_security_group_ids = [
    aws_security_group.frontend_sg.id
  ]

  tags = {
    Name = "frontend2-grotrack"
  }

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 20
    volume_type = "gp3"
  }

  user_data = file("scripts/default.sh")
}

# BACKEND (ZA)

resource "aws_instance" "backend_grotrack" {
  ami                    = "ami-0b6c6ebed2801a5cb"
  instance_type          = "t3.small"
  key_name               = aws_key_pair.grotrack_key.key_name
  subnet_id              = aws_subnet.private_za.id
  # private_ip             = "10.0.0.4"
  vpc_security_group_ids = [
    aws_security_group.backend_sg.id
  ]

  tags = {
    Name = "backend-grotrack"
  }

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 20
    volume_type = "gp3"
  }

  user_data = file("scripts/default.sh")
}

# DB (ZA)

resource "aws_instance" "db_grotrack" {
  ami                    = "ami-0b6c6ebed2801a5cb"
  instance_type          = "t3.small"
  key_name               = aws_key_pair.grotrack_key.key_name
  subnet_id              = aws_subnet.private_za.id
  # private_ip             = "10.0.0.5"
  vpc_security_group_ids = [
    aws_security_group.db_sg.id
  ]

  tags = {
    Name = "db-grotrack"
  }

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 20
    volume_type = "gp3"
  }

  user_data = file("scripts/default.sh")
}

# API (ZA)

resource "aws_instance" "api_grotrack" {
  ami                    = "ami-0b6c6ebed2801a5cb"
  instance_type          = "t3.small"
  key_name               = aws_key_pair.grotrack_key.key_name
  subnet_id              = aws_subnet.private_za.id
  # private_ip             = "10.0.0.6"
  vpc_security_group_ids = [
    aws_security_group.backend_sg.id
  ]

  tags = {
    Name = "api-grotrack"
  }

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 20
    volume_type = "gp3"
  }

  user_data = file("scripts/default.sh")
}