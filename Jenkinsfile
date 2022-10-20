pipeline {
    agent { docker 'cypress/base:10' }  
    environment {
        CI = 'true' 
    }
    stages {
        stage('Install Dependencies') {
            steps {
                sh "npm install"
                sh "npx cypress verify"
            }
        }
        stage('Build') { 
            steps {
                sh 'npm run build'
                }
            }
        stage('Test') {
            steps {
                script {
                    sh "npx cypress run --browser"
                } 
            }
        }                
    }

    post {
        always {
           sh 'echo "done"'
        }
    } 
}