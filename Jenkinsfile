pipeline {
    agent {
        // this image provides everything needed to run Cypress
        docker {
            image 'cypress/base:10'
        }
    }

    // tools {
    //     nodejs "node"
    //     "org.jenkinsci.plugins.docker.commons.tools.DockerTool" "docker"
    // }

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
                    // sh 'npm install'
                    sh 'npx run cypress verify'
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
                    sh "npx cypress run"
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