resource "github_repository" "tf_github_lab_base_repository" {
  name                 = "tf-lab-devops"
  description          = "${local.org_name} DevOps repository"
  visibility           = "private"
  vulnerability_alerts = true
  auto_init            = true

  template {
    owner      = local.org_name
    repository = "github-lab"


  }


}
