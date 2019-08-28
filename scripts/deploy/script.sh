#!/usr/bin/env bash

echo "Deploy script started"
echo "Working directory: $(pwd)"
echo "Directory content:"
ls -la

jenkins_stack_name=jenkins-hello-world
jenkins_change_set_name=jenkins-hello-world-change-set


echo "Check if the cloudformation stack already exists"
aws cloudformation describe-stacks \
  --stack-name ${jenkins_stack_name} >> /dev/null
if [[ ${?} -eq 0 ]]
then
  echo "Stack ${jenkins_stack_name} does not exist yet"
  change_set_type=UPDATE
else
  echo "Stack ${jenkins_stack_name} does not exist yet"
  change_set_type=CREATE
fi

echo "Create change set for AWS CloudFormation stack"
aws cloudformation create-change-set \
  --stack-name ${jenkins_stack_name} \
  --template-url https://${JENKINS_BUCKET}.s3-${AWS_DEFAULT_REGION}.amazonaws.com/packagedTemplate/infrastructurePackaged.yaml \
  --change-set-name ${jenkins_change_set_name} \
  --change-set-type ${change_set_type}

echo "Execute change set for AWS CloudFormation stack"
aws cloudformation execute-change-set \
  --change-set-name ${jenkins_change_set_name} \
  --stack-name ${jenkins_stack_name}

echo "Deploy script completed"