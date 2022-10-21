pipeline {
    agent any

    tools {nodejs "node"}

    parameters {
        string(name: 'SPEC', defaultValue: "cypress/e2e/**/**", description: "Enter the script path that you want to execute")
        choice(name: 'BROWSER', choices: ['chrome', 'edge', 'firefox'], description: "Choice the browser where you want to execute your scripts")
    }   

    options {
        ansiColor('xterm')
    }

    stages {
        stage('Install Dependencies') {
            steps {
                sh "node --version"
                sh "npm config ls"
                sh "npm install"         
            }
        }
        stage('Build') { 
            steps {
                sh 'npm run build'
                }
            }
        stage('Testing') {
            steps {
                script {
                    sh "npx cypress run --browser ${BROWSER} --spec ${SPEC}"
                } 
            }
        }    
        stage('Deploying') {
           steps {
               echo 'Deploying the application...'
           }
       }            
    }
}