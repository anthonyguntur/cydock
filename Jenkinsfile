pipeline {
    agent { 
        any {
            image 'cypress/base:10' 
            args '-p 3000:3000'
        } 
    }    

    stages {
        stage('Install Dependencies') {
            steps {
                sh "npm ci"
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
                    sh "CI=1 npx cypress run --browser"
                } 
            }
        }                
    }

    post {
        always {
           sh 'run reporting commands etc..'
   
        }
    } 
}