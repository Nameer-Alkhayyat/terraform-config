resource "aws_lambda_function" "ic-lambda" {
  filename      = "data/HelloWorld.zip"
  function_name = var.stage == "stage" ? "${var.projectName}-stage" :  "${var.projectName}"

  handler = "index.handler"
  runtime = "nodejs16.x"

  role = aws_iam_role.cloudwatch-full.arn

  environment {
    variables = {
      MONGO_URI=var.envVarMongoUri
      APPLE_NEWS_MONGO_URI=var.envVarAppleMongoUri
      PLUSIR_USER=var.envVarPlusirUser
      PLUSIR_PASSWORD=var.envVarPlusirPass
      TWITTER_KEY=var.envVarTwitterKey
      IMPORT_DATA=var.envVarImportData
      TEST_MONGO_URI=var.envVarTestMongoUri
    }
  }
}

resource "aws_lambda_permission" "allow_api" {
  statement_id  = "AllowAPIgatewayInvokation"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.ic-lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.api.execution_arn}/*/*/*"
 
}

resource "aws_iam_role" "cloudwatch-full" {
  name = var.stage == "stage" ? "${var.projectName}-stage-cloudwatch-full-access" :  "${var.projectName}-cloudwatch-full-access"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "cloudwatch-full-attachment" {
    role = aws_iam_role.cloudwatch-full.name
    policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
}
