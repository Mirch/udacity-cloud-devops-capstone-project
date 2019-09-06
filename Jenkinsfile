node {
    def registry = 'mirch/udacity-capstone-project'
    stage('Checkout') {
      checkout scm
    }
    stage('Environment') {
      sh 'git --version'
      echo "Branch: ${env.BRANCH_NAME}"
      sh 'docker -v'
    }
    stage('Building image') {
      withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
	      sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
	      sh "docker build -t ${registry} ."
	      sh "docker tag ${registry} ${registry}"
	      sh "docker push ${registry}"
      }
    }
}
