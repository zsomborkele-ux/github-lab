output "organization_id" {
  value = github_organization_settings.organization_settings.id
}

output "teams_ids" {
  value = toset([
    for team in values(github_team.teams) : team.id
  ])
}

output "security_manager_team_slug" {
  value = github_team.teams["Security Team"].slug
}

output "secret_names" {
  value = toset([
    github_actions_organization_secret.username.secret_name,
    github_actions_organization_secret.password.secret_name,
  ])
}

output "base_repository_name" {
  value = github_repository.tf_github_lab_base_repository.name
}
