pipeline {
    agent any
 
    stages {
        stage('test') {
            steps {
                sh 'rm -rf GoViolin'
                sh 'git clone https://github.com/Rosalita/GoViolin'
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t respect1/goviolin .'
            }
            post {
                  success{
                        slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME}  [${env.BUILD_NUMBER}]' (${env.BUILD_URL}console)")
                  }
                    failure{
                        slackSend (color: '#E83009', message: "FAILED: Job '${env.JOB_NAME}  [${env.BUILD_NUMBER}]' (${env.BUILD_URL}console)")
                  }
                    aborted{
                        slackSend (color: '#E8E209', message: "ABORTED: Job '${env.JOB_NAME}  [${env.BUILD_NUMBER}]' (${env.BUILD_URL}console)")
                  }
            }
        }
        stage('Publish') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                    sh "docker login --username $USERNAME --password $PASSWORD"
                    sh "docker push respect1/goviolin"
                }
            }
        }
    }
}
