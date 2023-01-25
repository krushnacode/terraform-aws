resource "aws_key_pair" "default" {
  key_name = "blog"
  public_key = "ssh-rsa AAA...agw== "

    tags = {
      "Name" = "xyz@blog.com"
    }
}