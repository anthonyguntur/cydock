pipeline {
    agent any

    tools {nodejs "node"}

    environment {
       NODEJS_HOME = "${tool node}"
       PATH="${NODEJS_HOME}:${PATH}"
       CHROME_BIN = '/bin/google-chrome'
    }

    stages {
        stage('Install Dependencies') {
            steps {
                sh "echo PATH"
                sh "node -version"
                sh "npm config ls"
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