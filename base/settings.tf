resource "github_organization_settings" "organization_settings" {
  billing_email                                            = "zsombor_kele@epam.com"
  company                                                  = local.org_name
  description                                              = "${local.org_name} organization for GitHub terraform lab"
  default_repository_permission                            = "read"
  members_can_create_repositories                          = false
  members_can_create_public_repositories                   = false
  members_can_create_private_repositories                  = false
  members_can_create_internal_repositories                 = false
  members_can_create_pages                                 = false
  members_can_create_public_pages                          = false
  members_can_create_private_pages                         = false
  members_can_fork_private_repositories                    = false
  web_commit_signoff_required                              = true
  dependabot_alerts_enabled_for_new_repositories           = true
  dependabot_security_updates_enabled_for_new_repositories = true
  dependency_graph_enabled_for_new_repositories            = true
  advanced_security_enabled_for_new_repositories           = false
}
