#!/bin/sh
set -e

mkdir -p ~/.aws
touch ~/.aws/credentials

echo "[default]
aws_access_key_id = ${AWS_ACCESS_KEY_ID}
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" > ~/.aws/credentials

echo "Excludes:  ${EXCLUDES}"

rm -f ${DESTINATION_FILE}
tar -zcvf ${DESTINATION_FILE} ${EXCLUDES} ${SOURCE_PATH}

aws s3 mv ${DESTINATION_FILE} s3://${AWS_S3_BUCKET}${DESTINATION_KEY} --region ${AWS_REGION}
