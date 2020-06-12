#!/bin/sh

set -e

mkdir -p ~/.aws
touch ~/.aws/credentials

echo "[default]
aws_access_key_id = ${AWS_ACCESS_KEY_ID}
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" > ~/.aws/credentials

(aws s3 ls s3://${AWS_S3_BUCKET}${DESTINATION_KEY}${FILE}) && \
     rm -rf ~/.aws && \
     echo "Ooops! Version already exists, aborting upload..." && \
     exit 1 \
|| (aws s3 cp ${SOURCE_PATH}${FILE} s3://${AWS_S3_BUCKET}${DESTINATION_KEY} --region ${AWS_REGION} $*) && rm -rf ~/.aws