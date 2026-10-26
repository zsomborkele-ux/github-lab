data "github_organization_roles" "all_roles" {}

locals {
  security_manager_id = one([
    for x in data.github_organization_roles.all_roles.roles : x.role_id
    if x.name == "security_manager"
  ])
}

resource "github_organization_role_team" "security_managers" {
  role_id   = local.security_manager_id
  team_slug = github_team.teams["Security Team"].slug
}