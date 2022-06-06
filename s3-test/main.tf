provider "aws" {
  region = "${var.region}"
}

resource "aws_s3_bucket" "mys3" {
  bucket = "mario-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "mys3-acl" {
  bucket = aws_s3_bucket.mys3.id
  acl    = "private"
}

