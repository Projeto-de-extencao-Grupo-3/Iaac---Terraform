resource "aws_s3_bucket" "grotrack_bucket_raw" {
  bucket = "grotrack-bucket-raw"

  tags = {
    Name        = "grotrack-bucket-raw"
    Environment = "test"
  }
}

resource "aws_s3_bucket" "grotrack_bucket_trusted" {
  bucket = "grotrack-bucket-trusted"

  tags = {
    Name        = "grotrack-bucket-trusted"
    Environment = "test"
  }
}

resource "aws_s3_bucket" "grotrack_bucket_client" {
  bucket = "grotrack-bucket-client"

  tags = {
    Name        = "grotrack-bucket-client"
    Environment = "test"
  }
}