resource "aws_s3_bucket" "bucket" {
  count = 5
  bucket = "nuumfactory-s3-count-15-${count.index}"
  tags = {
    count-index = "${count.index}"
  }
}
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
