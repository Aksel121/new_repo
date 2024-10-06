# Create a Secrets Manager secret for storing user credentials
resource "aws_secretsmanager_secret" "users" {
  name = "user-secrets"
}

# Create a dynamic secret string that includes usernames and passwords
resource "aws_secretsmanager_secret_version" "users" {
  secret_id     = aws_secretsmanager_secret.users.id
  
  # Dynamically generate a secret string that combines the created users and their passwords
  secret_string = jsonencode({
    for username, name_value in module.iam_users.created_users : 
    username => {
      username = name_value,
      password = var.user_passwords[username]  # Match password for the corresponding username
    }
  })
}
