#!/bin/sh

set -e

mkdir -p ~/.aws
touch ~/.aws/credentials

echo "[default]
aws_access_key_id = ${AWS_ACCESS_KEY_ID}
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" > ~/.aws/credentials

echo "Excludes:  ${EXCLUDES}"
echo "Includes:  ${INCLUDES}"

CMD=`tar -zcvf artifacts.tar.gz ${EXCLUDES} ${SOURCE_PATH}`
echo "Running $CMD"

#aws s3 mv artifacts.tar.gz s3://${AWS_S3_BUCKET}${DESTINATION_KEY} --region ${AWS_REGION} --debug
#aws s3 sync ${SOURCE_PATH} s3://${AWS_S3_BUCKET}${DESTINATION_KEY} --region ${AWS_REGION} ${INCLUDES} ${EXCLUDES} --debug
