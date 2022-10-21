pipeline {
    agent any

    tools {nodejs "node"}

    stages {
        stage('Install Dependencies') {
            steps {
                sh "node --version"
                sh "npm config ls"
                sh "npm install"
                sh "apt-get install libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb"
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