resource "github_repository" "app" {
  name                   = "tf-lab-app"
  description            = "TF GitHub lab repository for nodejs app"
  vulnerability_alerts   = true
  visibility             = "public"
  has_issues             = true
  has_projects           = true
  has_wiki               = true
  allow_squash_merge     = true
  allow_merge_commit     = true
  allow_rebase_merge     = true
  delete_branch_on_merge = true
  auto_init              = true
}

data "github_team" "nodejs" {
  slug = "nodejs-team"
}

data "github_team" "security" {
  slug = "security-team"
}

data "github_team" "devops" {
  slug = "devops-team"
}

resource "github_team_repository" "nodejs_push" {
  team_id    = data.github_team.nodejs.id
  repository = github_repository.app.name
  permission = "push"
}

resource "github_team_repository" "security_push" {
  team_id    = data.github_team.security.id
  repository = github_repository.app.name
  permission = "push"
}

resource "github_team_repository" "devops_pull" {
  team_id    = data.github_team.devops.id
  repository = github_repository.app.name
  permission = "pull"
}

resource "github_repository_file" "codeowners" {
  repository          = github_repository.app.name
  file                = ".github/CODEOWNERS"
  content             = "* @ORGANIZATION_NAME/SECURITY_TEAM_SLUG\n"
  commit_message      = "Add CODEOWNERS file"
  overwrite_on_create = true
}

resource "github_repository" "tf_github_lab_devops_repository" {
  name                 = "tf-lab-devops"
  description          = "gh-lab-zkele DevOps repository"
  visibility           = "private"
  vulnerability_alerts = true
  auto_init            = true
}
