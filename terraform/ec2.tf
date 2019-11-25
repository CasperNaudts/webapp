resource "aws_security_group" "web" {
  name        = "web-terraform"
  description = "web"

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = ["sg-09e63f0011cf285f7"]
  }

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = ["sg-0e93cfc9af75fc80a"]
  }

  egress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = ["sg-09e63f0011cf285f7"]
  }


  egress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = ["sg-0e93cfc9af75fc80a"]
  }

  tags = {
    Name = "web-terraform"
  }
}

resource "aws_instance" "weba1" {
  ami                    = "ami-08617a11c1209fe48"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  vpc_security_group_ids = ["${aws_security_group.web.id}"]
  key_name               = "Project"
  subnet_id              = "subnet-0a7b5d5e56474e9d2"

  tags = {
    Name = "terraform-web-A1"
  }
}

resource "aws_instance" "webb1" {
  ami                    = "ami-08617a11c1209fe48"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1b"
  vpc_security_group_ids = ["${aws_security_group.web.id}"]
  key_name               = "Project"
  subnet_id              = "subnet-096d0a1f9740e3e2f"

  tags = {
    Name = "terraform-web-B1"
  }
}