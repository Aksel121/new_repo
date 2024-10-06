
# # Secrets Manager Secret Version (storing usernames and passwords)
# resource "aws_secretsmanager_secret_version" "users" {
#   secret_id = aws_secretsmanager_secret.users.id
#   secret_string = jsonencode({
#     username1 = aws_iam_user.users["sysadmin1"].name
#     password1 = var.user_passwords["sysadmin1"]
#     username2 = aws_iam_user.users["sysadmin2"].name
#     password2 = var.user_passwords["sysadmin2"]
#     username3 = aws_iam_user.users["monitor1"].name
#     password3 = var.user_passwords["monitor1"]
#     username4 = aws_iam_user.users["monitor2"].name
#     password4 = var.user_passwords["monitor2"]
#     username5 = aws_iam_user.users["monitor3"].name
#     password5 = var.user_passwords["monitor3"]
#     username6 = aws_iam_user.users["monitor4"].name
#     password6 = var.user_passwords["monitor4"]
#     username7 = aws_iam_user.users["dbadmin1"].name
#     password7 = var.user_passwords["dbadmin1"]
#     username8 = aws_iam_user.users["dbadmin2"].name
#     password8 = var.user_passwords["dbadmin2"]
#   })
# }
