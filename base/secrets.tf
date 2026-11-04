resource "github_actions_organization_secret" "username" {
  secret_name     = "USERNAME"
  visibility      = "selected"
  plaintext_value = var.username
}

resource "github_actions_organization_secret" "password" {
  secret_name     = "PASSWORD"
  visibility      = "selected"
  plaintext_value = var.password
}

resource "github_actions_organization_secret_repositories" "username" {
  secret_name             = github_actions_organization_secret.username.secret_name
  selected_repository_ids = [data.github_repository.app.repo_id]
}

resource "github_actions_organization_secret_repositories" "password" {
  secret_name             = github_actions_organization_secret.password.secret_name
  selected_repository_ids = [data.github_repository.app.repo_id]
}
