resource "aws_vpc" "elk_vpc" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "ELK-VPC"
  }
}
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.elk_vpc.id
  
  cidr_block       = "192.168.1.0/24"
  availability_zone = "eu-west-1a"
  tags = {
    Name = "public_subnet"
  }
}
resource "aws_subnet" "private_monitor" {
  vpc_id      = aws_vpc.elk_vpc.id
  cidr_block = "192.168.2.0/24"
  #subnet_name =  "monitor_subnet"
  availability_zone = "eu-west-1a"
  tags = {
    Name = "monitor_subnet"
  }
}
resource "aws_subnet" "private_app_1a" {
  vpc_id      = aws_vpc.elk_vpc.id
  cidr_block = "192.168.3.0/24"
  # subnet_name =  "App-subnet1a"
  availability_zone = "eu-west-1a"
  tags = {
    Name = "App-subnet1a"
  }
}
resource "aws_subnet" "private_app_1b" {
  vpc_id      = aws_vpc.elk_vpc.id
  cidr_block = "192.168.4.0/24"
  # subnet_name =  "App-subnet1b"
  availability_zone = "eu-west-1b"
  tags = {
    Name = "App-subnet1b"
  }
}
resource "aws_subnet" "private_app_1c" {
  vpc_id      = aws_vpc.elk_vpc.id
  cidr_block = "192.168.5.0/24"
  # subnet_name =  "App-subnet1c"
  availability_zone = "eu-west-1c"
  tags = {
    Name = "App-subnet1c"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.elk_vpc.id

  tags = {
    Name = "internet gateway"
  }
}

resource "aws_eip" "nat_eip" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id

}