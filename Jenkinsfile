node {
    def registry = 'mirch/udacity-capstone-project'
    stage('Checking out git repo') {
      echo 'Checkout...'
      checkout scm
    }
    stage('Checking environment') {
      echo 'Checking environment...'
      sh 'git --version'
      echo "Branch: ${env.BRANCH_NAME}"
      sh 'docker -v'
    }
    stage("Linting") {
      echo 'Linting...'
      sh '/home/ubuntu/.local/bin/hadolint Dockerfile'
    }
    stage('Building image') {
	    echo 'Building Docker image...'
      	    withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
	     	sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
	     	sh "docker build -t ${registry} ."
	     	sh "docker tag ${registry} ${registry}"
	     	sh "docker push ${registry}"
      }
    }
    stage('Deploying') {
      echo 'Deploying to AWS...'
      dir ('./') {
        withAWS(credentials: 'aws-credentials', region: 'eu-central-1') {
            withKubeConfig(serverUrl: 'https://61D2CCC75991D12A530D1EF702CC2BA8.sk1.eu-central-1.eks.amazonaws.com') {
              sh "kubectl set image deployments/capstone-app capstone-app=${registry}:latest"
              sh "kubectl get nodes"
              sh "kubectl get pods"
            }
        }
      }
    }
    stage("Cleaning up") {
      echo 'Cleaning up...'
      sh "docker system prune"
    }
}
