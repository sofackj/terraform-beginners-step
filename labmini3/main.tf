resource "aws_s3_bucket" "bucket" {
  bucket = "nuumfactory-s3-null-resource-15"
  
}

resource "aws_s3_bucket_versioning" "example" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Suspended"
  }
  resource "null_resource" "toto" {
    triggers = {
      status = aws_s3_bucket_versioning.example.versioning_configuration[0].status
    }
    provisioner "local-exec" {
      command = "echo 'Statut du versioning : ${self.versioning_configuration}' > test.txt"
    }
  }
}

