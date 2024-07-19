resource "github_repository" "dev_env" {
  name        = "awslearning_dev"
  description = "My learning aws module"
  visibility = "public"
  auto_init = true
}
resource "github_repository" "prod_env" {
  name = "awslearning_prod"
  description = "My learning aws module_1"
  visibility = "public"
  auto_init = true
}
output "github_repository_url" {
  value = github_repository.dev_env.html_url
}