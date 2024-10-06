resource "aws_s3_bucket" "gogreen1010_bucket" {
  bucket = "my-cloud-fusion-gogreen"
}

resource "aws_s3_bucket_lifecycle_configuration" "bucket-config" {
  bucket = aws_s3_bucket.gogreen1010_bucket.id

  rule {
    id = "log"

    expiration {
      days = 90
    }

    filter {
      and {
        prefix = "log/"

        tags = {
          rule      = "log"
          autoclean = "true"
        }
      }
    }

    status = "Enabled"

    transition {
      days          = 30             # accessed less frequently
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 60             # log file are even less likely need 
      storage_class = "GLACIER"
    }
  }

  rule {
    id = "tmp"

    filter {
      prefix = "tmp/"
    }

    expiration {
      date = "2025-02-13T00:00:00Z"
    }

    status = "Enabled"
  }
}

resource "aws_s3_bucket_versioning" "versioning-gogreen" {
  bucket = aws_s3_bucket.gogreen1010_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# these rules automatically move files to cheaper storage classes (standard_IA and Glacier)
# the rules set up automatic deletion for files that are no longer needed
