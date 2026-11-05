module "spa" {
  source = "./modules/repository"

  name                   = "tf-lab-spa"
  private                = true
  has_issues             = true
  has_projects           = true
  default_branch         = "main"
  auto_init              = false
  delete_branch_on_merge = false
}
