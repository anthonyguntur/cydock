pipeline {
    agent any

    tools {
        nodejs "NodeJs"
    }
    // agent {
    //     // this image provides everything needed to run Cypress
    //     docker {
    //         image 'cypress/base:12'
    //     }
    // }


        // "org.jenkinsci.plugins.docker.commons.tools.DockerTool" "docker"
        // "jenkins.plugins.nodejs.tools.NodeJSInstallation" "node"
    

    // parameters {
    //     string(name: 'SPEC', defaultValue: "cypress/e2e/**/**", description: "Enter the script path that you want to execute")
    //     choice(name: 'BROWSER', choices: ['chrome', 'edge', 'firefox'], description: "Choice the browser where you want to execute your scripts")
    // }   

    // options {
    //     ansiColor('xterm')
    // }

    stages {
        stage('Build') { 
            steps {                    
                    echo "Running build ${env.BUILD_ID} on ${env.JENKINS_URL}"
                    sh 'npm config ls'
                    sh 'npm cache clean --force'
                    sh 'npm install -g cypress'
                    sh 'node --version'
                    sh 'npm --version'
                    // sh 'npm i'
                    sh 'npx cypress verify'
                    sh 'cypress --version'                    
                }
            }
        // stage('start local server') {
        //     steps {
        //         // start local server in the background
        //         // we will shut it down in "post" command block
        //         sh 'nohup npm run start &'
        //     }
        // }
        stage('Testing') {
            steps {
                script {
                    sh "npx cypress run --spec 'cypress/e2e/1-getting-started/*' --config video=false"
                } 
            }
        }    
        stage('Deploying') {
           steps {
               echo 'Deploying the application..'
           }
       }            
    }

    // post {
    //     // shutdown the server running in the background
    //     always {
    //         echo 'Stopping local server'
    //         sh 'pkill -f http-server'
    //     }
    // }

    // post {
    //     always {
    //         publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: true, reportDir: 'cypress/report', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: '', useWrapperFileDirectly: true])
    //     }
    // }
}