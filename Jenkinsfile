pipeline {
  agent any
  stages {
    stage('FirstStage') {
      agent {
        node {
          label 'my-label'
        }

      }
      steps {
        git(url: 'https://github.com/MicheledG/JenkinsHelloWorld.git', branch: 'master', poll: true)
        sh '''pwd
ls -la'''
      }
    }
  }
}