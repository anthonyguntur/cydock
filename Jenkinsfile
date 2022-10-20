pipeline {
    agent any
    environment {
       CHROME_BIN = '/bin/google-chrome'
    }
    stages {
        stage('Install Dependencies') {
            steps {
                sh "apk add nodejs"
                sh "echo $PATH"
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
                    sh "npx cypress run"
                } 
            }
        }    
        stage('Deploy') {
           steps {
               echo 'Deploying....'
           }
       }            
    }
}