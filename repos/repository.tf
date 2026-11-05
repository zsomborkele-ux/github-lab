module "app" {
  source = "./modules/repository"

  name                 = "tf-lab-app"
  description          = "TF GitHub lab repository for nodejs app"
  private              = false
  has_issues           = true
  has_projects         = true
  has_wiki             = true
  vulnerability_alerts = true
  auto_init            = true
  teams = [
    {
      name        = "nodejs-team"
      permissions = "push"
    },
    {
      name        = "security-team"
      permissions = "push"
    },
    {
      name        = "devops-team"
      permissions = "pull"
    },
  ]

  # The base state currently manages access to the organization secrets.
  organization_secrets = []
}

resource "github_repository_file" "codeowners" {
  repository          = module.app.name
  file                = ".github/CODEOWNERS"
  content             = "* @ORGANIZATION_NAME/SECURITY_TEAM_SLUG\n"
  commit_message      = "Add CODEOWNERS file"
  overwrite_on_create = true
}

module "devops" {
  source = "./modules/repository"

  name                   = "tf-lab-devops"
  description            = "gh-lab-zkele DevOps repository"
  private                = true
  vulnerability_alerts   = true
  auto_init              = true
  delete_branch_on_merge = false
}
