resource "github_actions_organization_permissions" "app" {
  enabled_repositories = "selected"

  enabled_repositories_config {
    repository_ids = [data.github_repository.app.repo_id]
  }

  allowed_actions = "all"
}