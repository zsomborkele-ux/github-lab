resource "github_team" "teams" {
  for_each = var.teams

  name        = each.key
  privacy     = each.value.privacy
  description = each.value.description
}

moved {
  from = github_team.devops_team
  to   = github_team.teams["devops-team"]
}

moved {
  from = github_team.nodejs_team
  to   = github_team.teams["nodejs-team"]
}

moved {
  from = github_team.security_team
  to   = github_team.teams["Security Team"]
}
