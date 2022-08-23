resource "aws_route_table" "igw_route_tbl" {
  vpc_id = aws_vpc.elk_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "igw-route-table"
  }
}

resource "aws_route_table" "nat_route_tbl" {
  vpc_id = aws_vpc.elk_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "nat-route-table"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.igw_route_tbl.id
}

resource "aws_route_table_association" "mon_private" {
  subnet_id      = aws_subnet.private_monitor.id
  route_table_id = aws_route_table.nat_route_tbl.id
}

resource "aws_route_table_association" "app_private1a" {
  #for_each = aws_subnet.App_subnet

  subnet_id      = aws_subnet.private_app_1a.id
  route_table_id = aws_route_table.nat_route_tbl.id
}

resource "aws_route_table_association" "app_private1b" {
  #for_each = aws_subnet.App_subnet

  subnet_id      = aws_subnet.private_app_1b.id
  route_table_id = aws_route_table.nat_route_tbl.id
}

resource "aws_route_table_association" "app_private1c" {
  #for_each = aws_subnet.App_subnet

  subnet_id      = aws_subnet.private_app_1c.id
  route_table_id = aws_route_table.nat_route_tbl.id
}