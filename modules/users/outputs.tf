# modules/users/outputs.tf
output "created_users" {
# Extract the user names from the for_each resource using the keys
  value = [for user in aws_iam_user.users : user.name]
}