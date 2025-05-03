provider "aws" {
  region = "eu-west-1" # Replace with your desired region
}

data "aws_caller_identity" "current" {}


# Create an IAM user
resource "aws_iam_user" "tf_user" {
  name = "tf-user"
  tags = {
    Name = "Terraform Userrrrrrr"
  }
}

resource "aws_iam_user_login_profile" "tf_user_login" {
  user                    = aws_iam_user.tf_user.name
  password_reset_required = true
 
}

output "arn" {
  value       = aws_iam_user.tf_user.arn
  description = "This is the arn for tfuser"
}

output "iam_user_password" {
  value = aws_iam_user_login_profile.tf_user_login.password
  sensitive = true

}

output "iam_user_account_id" {
  value =   data.aws_caller_identity.current.account_id
}



