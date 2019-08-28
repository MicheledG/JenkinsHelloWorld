#!/usr/bin/env bash

echo "Deploy script started"
echo "Working directory: $(pwd)"
echo "Directory content:"
ls -la

jenkins_stack_name=jenkins-hello-world
jenkins_change_set_name=jenkins-hello-world-change-set

echo "Create change set for AWS CloudFormation stack"
aws cloudformation create-change-set \
  --stack-name ${jenkins_stack_name} \
  --template-url s3://${JENKINS_BUCKET}/packagedTemplate/infrastructurePackaged.yaml \
  --change-set-name ${jenkins_change_set_name}

echo "Execute change set for AWS CloudFormation stack"
aws cloudformation execute-change-set \
  --change-set-name ${jenkins_change_set_name} \
  --stack-name ${jenkins_stack_name}

echo "Deploy script completed"