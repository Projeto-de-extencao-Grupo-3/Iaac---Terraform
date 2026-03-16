resource "aws_s3_bucket" "grotrack_bucket_raw" {
  bucket = "grotrack-bucket-raw"

  tags = {
    Name        = "grotrack-bucket-raw"
    Environment = "test"
  }
}

# resource "aws_s3_object" "client_csv_upload" {
#   bucket = aws_s3_bucket.grotrack_bucket_raw.bucket
#   key    = "analise/feriados_tratados.csv"
#   source = "analise/feriados_completo.csv"

#   etag = filemd5("analise/feriados_completo.csv")
# }

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

resource "aws_s3_object" "client_csv_upload" {
  bucket = aws_s3_bucket.grotrack_bucket_client.bucket
  key    = "analise/feriados_tratados.csv"
  source = "analise/feriados_completo.csv"

  etag = filemd5("analise/feriados_completo.csv")
}

resource "aws_s3_object" "pem_upload" {
  bucket = aws_s3_bucket.grotrack_bucket_client.bucket
  key    = "keys/key-grotrack.pem"
  source = "key-grotrack.pem"

  etag = filemd5("key-grotrack.pem")
}

resource "aws_s3_object" "pdf_upload" {
  bucket = aws_s3_bucket.grotrack_bucket_client.bucket
  key    = "pdf/OS0001_ANA_PAULA_MARTINS_FRO1C23.pdf"
  etag = filemd5("pdf/OS0001_ANA_PAULA_MARTINS_FRO1C23.pdf")
}