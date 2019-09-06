node {
    def registry = 'mirch/udacity-capstone-project'
    stage('Checkout') {
      echo 'Checkout...'
      checkout scm
    }
    stage('Environment') {
      echo 'Checking environment...'
      sh 'git --version'
      echo "Branch: ${env.BRANCH_NAME}"
      sh 'docker -v'
    }
    stage("Linting") {
	echo 'Linting...'
	sh 'pwd'
    	sh 'hadolint Dockerfile'
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
}
