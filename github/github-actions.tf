# resource "aws_s3_bucket" "deployment" {
#   bucket = var.stage == "stage" ? "${var.projectName}-stage" : var.projectName
#   acl = "private"

#   tags = {
#     stage = var.stage
#   }
# }

resource "github_actions_secret" "githubNpmPat" {
  repository       = var.projectName
  secret_name      = "NPM_PAT"
  plaintext_value  = var.githubActionsGithubNpmPat
}

resource "github_actions_secret" "awsKeyId" {
  repository       = var.projectName
  secret_name      = "AWS_ACCESS_KEY_ID"
  plaintext_value  = var.githubActionsAwsKeyId
}

resource "github_actions_secret" "awsKeySecret" {
  repository       = var.projectName
  secret_name      = "AWS_ACCESS_KEY_SECRET"
  plaintext_value  = var.githubActionsAwsKeySecret
}
