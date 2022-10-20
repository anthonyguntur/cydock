pipeline {
    agent any
    tools {nodejs "NodeJS"}
    environment {
       CHROME_BIN = '/bin/google-chrome'
    }
    stages {
        stage('Install Dependencies') {
            steps {
                sh "sudo ln -sf "$(which node)" /usr/bin/node"
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