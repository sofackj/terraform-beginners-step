resource "aws_s3_bucket" "bucket" {
  bucket = "nuumfactory-s3-import-15"
}
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket" "bucket2" {
  bucket = "nuumfactory-s3-import-2-15"
  tags = {
    imported = "true"
  }
}
resource "aws_s3_bucket_versioning" "versioning_example2" {
  bucket = aws_s3_bucket.bucket2.id
  versioning_configuration {
    status = "Enabled"
  }
}