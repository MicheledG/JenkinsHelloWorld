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
ls -la'''
      }
    }
  }
}