moved {
  from = github_repository.app
  to   = module.app.github_repository.this
}

moved {
  from = github_team_repository.nodejs_push
  to   = module.app.github_team_repository.access["nodejs-team"]
}

moved {
  from = github_team_repository.security_push
  to   = module.app.github_team_repository.access["security-team"]
}

moved {
  from = github_team_repository.devops_pull
  to   = module.app.github_team_repository.access["devops-team"]
}

moved {
  from = github_repository.tf_github_lab_devops_repository
  to   = module.devops.github_repository.this
}

moved {
  from = github_repository.tf_github_lab_spa_repository
  to   = module.spa.github_repository.this
}
