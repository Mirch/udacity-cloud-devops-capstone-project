node {
    def capstoneApp
    def registry = 'mirch/udacity-capstone-project'
    def registryCredential = 'dockerhub'
  
  try {
    stage('Checkout') {
      checkout scm
    }
    stage('Environment') {
      sh 'git --version'
      echo "Branch: ${env.BRANCH_NAME}"
      sh 'docker -v'
    }
    stage('Building image') {
      docker.withRegistry( 'https://docker.io/' + registry, registryCredential ) {
	      sh "docker build -t ${registry} ."
	      sh "docker tag ${registry} ${registry}"
	      sh "docker push ${registry}"
	      
      }
    }
    stage('Deploy'){
      docker.withRegistry( 'https://docker.io/' + registry, registryCredential ) {
    	  capstoneApp.push 'latest2'
      }
    }
  }
  catch (err) {
    throw err
  }
}
Do
