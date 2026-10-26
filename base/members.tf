resource "github_membership" "zkele1" {
  username = "zkele1"
  role     = "member"
}

resource "github_team_membership" "zkele1_devops_team" {
  team_id  = github_team.teams["devops-team"].id
  username = github_membership.zkele1.username
  role     = "member"
}
