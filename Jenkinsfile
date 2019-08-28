pipeline {
  agent none
  stages {
    stage('FirstStage') {
      steps {
        git(url: 'https://github.com/MicheledG/JenkinsHelloWorld.git', branch: 'master', poll: true)
        sh '''pwd
ls -la'''
      }
    }
  }
}