pipeline {
  agent any
  stages {
    stage('Lint') {
      steps {
        sh 'sudo apt install linuxbrew-wrapper'
        sh 'brew install hadolint'
        sh 'hadolint Dockerfile'
      }
    }
    stage('Build') {
      steps {
        sh 'yarn build'
      }
    }
    stage('Deploy') {
      steps {
        sh 'Deploying...'
      }
    }
  }
}
