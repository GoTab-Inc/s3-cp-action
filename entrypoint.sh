#!/bin/sh

set -e

mkdir -p ~/.aws
touch ~/.aws/credentials

echo "[default]
aws_access_key_id = ${AWS_ACCESS_KEY_ID}
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" > ~/.aws/credentials

aws s3 sync  --exclude ".git*" --exclude "*.DS_Store" --exclude "utils/deprecated/*" --exclude "*.pyc" --exclude "cache*" --exclude ".vscode*" --exclude "*.spec" --exclude "*Dockerfile*" --exclude "utils/sample_receipts*" --exclude "build.sh" --exclude ".dockerignore" --exclude ".stage" ${SOURCE_PATH} s3://${AWS_S3_BUCKET}${DESTINATION_KEY} --region ${AWS_REGION}
