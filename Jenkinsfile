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
    stage('Build Docker test'){
     sh 'docker build -t udacity-capstone-test -f Dockerfile.test --no-cache .'
    }
    stage('Docker test'){
      sh 'docker run --rm udacity-capstone-test'
    }
    stage('Clean Docker test'){
      sh 'docker rmi udacity-capstone-test'
    }
    stage('Deploy'){
      if(env.BRANCH_NAME == 'master'){
        sh 'docker build -t udacity-capstone-project --no-cache .'
        sh 'docker tag udacity-capstone-test localhost:5000/udacity-capstone-test'
        sh 'docker push localhost:5000/udacity-capstone-test'
        sh 'docker rmi -f react-app localhost:5000/udacity-capstone-test'
      }
    }
  }
  catch (err) {
    throw err
  }
}
Do
