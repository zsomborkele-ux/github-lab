resource "github_repository" "this" {
  name                   = var.name
  description            = var.description == "" ? null : var.description
  homepage_url           = var.homepage == "" ? null : var.homepage
  private                = var.private
  has_issues             = var.has_issues
  has_projects           = var.has_projects
  has_wiki               = var.has_wiki
  default_branch         = var.default_branch
  allow_squash_merge     = var.allow_squash_merge
  allow_merge_commit     = var.allow_merge_commit
  allow_rebase_merge     = var.allow_rebase_merge
  delete_branch_on_merge = var.delete_branch_on_merge
  vulnerability_alerts   = var.vulnerability_alerts
  auto_init              = var.auto_init
}

data "github_team" "teams" {
  for_each = {
    for team in var.teams : team.name => team
  }

  slug = each.value.name
}

resource "github_team_repository" "access" {
  for_each = {
    for team in var.teams : team.name => team
  }

  team_id    = data.github_team.teams[each.key].id
  repository = github_repository.this.name
  permission = each.value.permissions
}

resource "github_branch_protection" "branch" {
  for_each = {
    for branch in var.branches : branch.name => branch
  }

  repository_id          = github_repository.this.name
  pattern                = each.value.name
  require_signed_commits = each.value.requiresCommitSignatures
  enforce_admins         = each.value.isAdminEnforced

  dynamic "required_pull_request_reviews" {
    for_each = each.value.requiresApprovingReviews ? [each.value] : []

    content {
      required_approving_review_count = required_pull_request_reviews.value.requiredApprovingReviewCount
      dismiss_stale_reviews           = required_pull_request_reviews.value.dismissesStaleReviews
      require_code_owner_reviews      = required_pull_request_reviews.value.requiresCodeOwnerReviews
    }
  }

  dynamic "required_status_checks" {
    for_each = each.value.requiresStatusChecks ? [each.value] : []

    content {
      contexts = required_status_checks.value.requiredStatusCheckContexts
      strict   = required_status_checks.value.requiresStrictStatusChecks
    }
  }

  dynamic "restrict_pushes" {
    for_each = each.value.restrictsPushes ? [each.value] : []

    content {
      push_allowances = restrict_pushes.value.pushActorIds
    }
  }
}

resource "github_actions_organization_secret_repositories" "organization_secret" {
  for_each = toset(var.organization_secrets)

  secret_name             = each.value
  selected_repository_ids = [github_repository.this.repo_id]
}

resource "github_actions_secret" "repository_secret" {
  for_each = nonsensitive(toset(keys(var.repository_secrets)))

  repository  = github_repository.this.name
  secret_name = each.key
  value       = var.repository_secrets[each.key]
}
