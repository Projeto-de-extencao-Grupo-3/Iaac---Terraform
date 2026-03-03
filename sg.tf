# SECURITY GROUPS (VAZIOS)

resource "aws_security_group" "frontend_sg" {
  name   = "frontend-sg"
  vpc_id = aws_vpc.grotrack_vpc.id
}

resource "aws_security_group" "backend_sg" {
  name   = "backend-sg"
  vpc_id = aws_vpc.grotrack_vpc.id
}

resource "aws_security_group" "db_sg" {
  name   = "db-sg"
  vpc_id = aws_vpc.grotrack_vpc.id
}

# FRONTEND - HTTP / HTTPS

resource "aws_security_group_rule" "frontend_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.frontend_sg.id
}

resource "aws_security_group_rule" "frontend_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.frontend_sg.id
}

# FRONTEND -> BACKEND (8080)

resource "aws_security_group_rule" "frontend_to_backend" {
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = aws_security_group.frontend_sg.id
  source_security_group_id = aws_security_group.backend_sg.id
}

resource "aws_security_group_rule" "backend_from_frontend" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = aws_security_group.backend_sg.id
  source_security_group_id = aws_security_group.frontend_sg.id
}

# BACKEND -> DB (3306)

resource "aws_security_group_rule" "backend_to_db" {
  type                     = "egress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = aws_security_group.backend_sg.id
  source_security_group_id = aws_security_group.db_sg.id
}

resource "aws_security_group_rule" "db_from_backend" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = aws_security_group.db_sg.id
  source_security_group_id = aws_security_group.backend_sg.id
}

# SSH INTERNO (10.0.0.0/24)

resource "aws_security_group_rule" "ssh_frontend" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.frontend_sg.id
}

resource "aws_security_group_rule" "ssh_backend" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["10.0.0.0/24"]
  security_group_id = aws_security_group.backend_sg.id
}

resource "aws_security_group_rule" "ssh_db" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["10.0.0.0/24"]
  security_group_id = aws_security_group.db_sg.id
}

# SAÍDA TOTAL PARA INTERNET

resource "aws_security_group_rule" "frontend_egress_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.frontend_sg.id
}

resource "aws_security_group_rule" "backend_egress_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.backend_sg.id
}

resource "aws_security_group_rule" "db_egress_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.db_sg.id
}