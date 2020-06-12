FROM python:3.7-alpine

LABEL "com.github.actions.name"="S3 Copy with existence check"
LABEL "com.github.actions.description"="Copy a file to an AWS S3 bucket, as long as the file does not already exist - Fork of jakejarvis/s3-sync-action"
LABEL "com.github.actions.icon"="copy"
LABEL "com.github.actions.color"="green"

LABEL version="1.0.1"
LABEL repository="https://github.com/airuleguy/s3-cp-action"
LABEL maintainer="Alejandro Iruleguy <ale.iruleguy@gmail.com>"

# https://github.com/aws/aws-cli/blob/master/CHANGELOG.rst
ENV AWSCLI_VERSION='1.18.78'

RUN pip install --quiet --no-cache-dir awscli==${AWSCLI_VERSION}

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
