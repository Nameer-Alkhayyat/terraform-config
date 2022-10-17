variable "projectName" {
}

variable "stage" {
    default = "stage" # stage | prod
}

# Github organization where the repo exists (repo named like projectName)
variable "githubOrganisation" {
  default = "as-ideas"
}

# Personal Access Token to modify Github settings
variable "githubPat" {
}

# Personal Access Token for Github Actions to access Github NPM registry
variable "githubActionsGithubNpmPat" {
}

# Github Actions S3 Deployment
variable "githubActionsAwsKeyId" {
}

# Github Actions S3 Deployment
variable "githubActionsAwsKeySecret" {
}

