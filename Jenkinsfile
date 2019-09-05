pipeline {
  agent any
  stages {
    stage('Lint') {
      steps {
        echo 'Linting...'
      }
    }
    stage('Build') {
      steps {
        sh 'yarn build'
      }
    }
    stage('Deploy') {
      steps {
        echo 'Deploying...'
      }
    }
  }
}
