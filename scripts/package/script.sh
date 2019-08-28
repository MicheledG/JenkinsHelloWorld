#!/usr/bin/env bash

echo "Package script started"
echo "Working directory: $(pwd)"
echo "Directory content:"
ls -la

echo "Create AWS CloudFormation package"
aws cloudformation package \
  --template-file cloudformation/template/infrastructure.yaml \
  --s3-bucket ${JENKINS_BUCKET} \
  --s3-prefix data-artifacts \
  --output-template-file infrastructurePackaged.yaml \
  --region ${AWS_DEFAULT_REGION} >> /dev/null

echo "Upload created cloudformation package on S3"
aws s3 cp infrastructurePackaged.yaml \
  s3://${JENKINS_BUCKET}/packagedTemplate/ \
  --region ${AWS_DEFAULT_REGION}

echo "Package script completed"