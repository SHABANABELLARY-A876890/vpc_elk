terraform {
  backend "s3" {
    bucket         = "talent-academy-shabana1-lab-tfstates"
    key            = "talent-academy/vpc_elk/terraform.tfstates"
    region         = "eu-west-1"
    dynamodb_table = "terraform-lock"
  }
}