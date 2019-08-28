pipeline {
  agent {
    node {
      label 'master'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh '''echo "Build stage started"
echo "working path: $(pwd)"
echo "working folder content"
ls -la

aws cloudformation list-stacks'''
      }
    }
  }
  environment {
    AWS_DEFAULT_REGION = 'eu-west-1'
    JENKINS_BUCKET = 'jenkins_bucket=jenkins-hello-world-cicd'
  }
}