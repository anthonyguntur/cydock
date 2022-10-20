pipeline {
    agent any
    tools {nodejs "Node16"}
    environment {
       CHROME_BIN = '/bin/google-chrome'
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