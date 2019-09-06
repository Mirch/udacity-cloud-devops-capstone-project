node {
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
        sh './run_docker.sh'
    }
  }
  catch (err) {
    throw err
  }
}
Do
