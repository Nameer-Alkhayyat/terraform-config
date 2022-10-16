resource "aws_lambda_function" "ic-lambda" {
  filename      = "data/HelloWorld.zip"
  function_name = var.stage == "stage" ? "${var.projectName}-stage" :  "${var.projectName}"

  handler = "index.handler"
  runtime = "nodejs16.x"

  role = aws_iam_role.cloudwatch-full.arn

  environment {
    variables = {
      MONGO_URI=var.envVarMongoUri
      SWAGGER_ENABLED=var.envVarSwaggerEnabled
      SWAGGER_USER=var.envVarSwaggerUser
    }
  }
}