node {
  environment {
    registry = "mirch/udacity-capstone-project"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  try {
    stage('Checkout') {
      checkout scm
    }
    stage('Environment') {
      sh 'git --version'
      echo "Branch: ${env.BRANCH_NAME}"
      sh 'docker -v'
      sh 'printenv'
    }
    stage('Deploy'){
        docker.withRegistry('', registryCredential) {
            dockerImage.push()
          }
    }
  }
  catch (err) {
    throw err
  }
}
Do
