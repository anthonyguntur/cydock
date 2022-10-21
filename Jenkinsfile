pipeline {
    agent any

    tools {nodejs "node"}

    stages {
        stage('Install Dependencies') {
            steps {
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