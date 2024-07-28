resource "aws_s3_bucket" "examplebucket" {
  bucket = "awstechs3"

}

resource "aws_s3_object" "examplebucket_object" {
  key    = "terraform.tfstate"
  bucket = aws_s3_bucket.examplebucket.id
}   

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.examplebucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.examplebucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "${aws_iam_user.aws_admin_IAMuser.unique_id}"
        }
        Action = [
          "s3:*"
        ]
        Resource = [
          "${aws_s3_bucket.examplebucket.arn}/*",
          "${aws_s3_bucket.examplebucket.arn}"
        ]
      }
    ]
  })
}
 
resource "aws_iam_user_policy_attachment" "iam_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  user       = aws_iam_user.aws_admin_IAMuser.name
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.examplebucket.id
  versioning_configuration {
    status = "Enabled"
  }
}