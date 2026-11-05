resource "github_membership" "zkele1" {
  username = "zkele1"
  role     = "member"
}

moved {
  from = github_team_membership.zkele1_devops_team
  to   = github_team_membership.devops_team[0]
}

resource "github_team_membership" "devops_team" {
  count = length(var.devops_team_membership)

  team_id  = github_team.teams["devops-team"].id
  username = var.devops_team_membership[count.index]
  role     = "member"
}

resource "github_team_membership" "nodejs_team" {
  count = length(var.nodejs_team_membership)

  team_id  = github_team.teams["nodejs-team"].id
  username = var.nodejs_team_membership[count.index]
  role     = "member"
}

resource "github_team_membership" "security_team" {
  count = length(var.security_team_membership)

  team_id  = github_team.teams["Security Team"].id
  username = var.security_team_membership[count.index]
  role     = "member"
}
