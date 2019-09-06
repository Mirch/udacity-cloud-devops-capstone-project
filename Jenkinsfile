node {
    def capstoneApp
    def registry = 'mirch/udacity-caphstone-project'
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
		  def buildName = registry + ":$BUILD_NUMBER"
			capstoneApp = docker.build buildName
			capstoneApp.push()
      }
    }
    stage('Deploy'){
      docker.withRegistry( 'https://' + registry, registryCredential ) {
    	  capstoneApp.push 'latest2'
      }
    }
  }
  catch (err) {
    throw err
  }
}
Do
