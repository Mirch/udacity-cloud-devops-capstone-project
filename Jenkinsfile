pipeline {
    agent any 
    stages {
        stage('Lint') { 
            steps { 
                sh 'hadolint Dockerfile' 
            }
        }
        stage('Build') { 
            steps { 
                sh 'yarn build' 
            }
        }
        stage('Deploy') {
            steps {
                sh 'Deploying...'
            }
        }
    }
}
