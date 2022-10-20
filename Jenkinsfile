pipeline {

    agent { dockerfile true }

    triggers {
         cron('H 08 * * *')
    }
    
    parameters {
        choice(name: 'BROWSER', choices: ['chrome', 'electron', 'firefox'], description: 'Pick the web browser you want to use to run your scripts')
        choice(name: 'ENVIRONMENT', choices: ['stage','dev', 'prod'], description: 'Pick the environment to test against')
        choice(name: 'TEST', choices: ['@regression','@smoke'], description: 'Pick the type of test to runned')
    }
   
    stages {
        stage('Run Tests') {
            parallel {
                stage('Test Home') {
                    steps {
                        script {
                            sh "npx cypress run --browser ${BROWSER} --env configFile=${ENVIRONMENT}"
                        } 
                    }
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