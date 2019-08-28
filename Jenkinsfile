pipeline {
  agent {
    node {
      label 'master'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh 'sh ./scripts/build/script.sh'
      }
    }
    stage('Package') {
      steps {
        sh 'sh ./scripts/package/script.sh'
      }
    }
    stage('Deploy') {
      steps {
        sh 'sh ./scripts/deploy/script.sh'
      }
    }
  }
  environment {
    AWS_DEFAULT_REGION = 'eu-west-1'
    JENKINS_BUCKET = 'jenkins-hello-world-cicd'
  }
}