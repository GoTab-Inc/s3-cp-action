#!/bin/sh

set -e

mkdir -p ~/.aws
touch ~/.aws/credentials

echo "[default]
aws_access_key_id = ${AWS_ACCESS_KEY_ID}
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" > ~/.aws/credentials

CMD="aws s3 sync ${INCLUDES} ${EXCLUDES} ${SOURCE_PATH} s3://${AWS_S3_BUCKET}${DESTINATION_KEY} --region ${AWS_REGION}"
echo "Running $CMD"
$CMD
