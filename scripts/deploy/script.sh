#!/usr/bin/env bash

echo "Deploy script started"

jenkins_stack_name=jenkins-hello-world
jenkins_change_set_name=jenkins-hello-world-change-set

echo "Create change set for AWS CloudFormation stack"
aws create-change-set \
  --stack-name ${jenkins_stack_name} \
  --template-url s3://${JENKINS_BUCKET}/packagedTemplate/infrastructurePackaged.yaml \
  --change-set-name ${jenkins_change_set_name}

echo "Execute change set for AWS CloudFormation stack"
aws execute-change-set \
  --change-set-name ${jenkins_change_set_name} \
  --stack-name ${jenkins_stack_name}

echo "Deploy script completed"