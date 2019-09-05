pipeline {
  agent {
        docker {
            image 'node:6' 
            args '-p 3000:3000' 
        }
    }
  stages {
    stage('Lint') {
      steps {
        echo 'Linting...'
      }
    }
    stage('Build') {
      steps {
        sh 'yarn'
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
