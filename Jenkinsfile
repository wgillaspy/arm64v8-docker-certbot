pipeline {
  agent {
      label 'jenkins-bc-did'
  }
 triggers {
       pollSCM('H 5 * * 1')
 }
 stages {
    stage('Start docker') {
      steps {

       sh "/usr/local/bin/dockerd-entrypoint.sh &"
       sh "sleep 30"

        withCredentials([usernamePassword(credentialsId: 'docker-io-login', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
          sh "echo $PASS | docker login --username $USER --password-stdin"
        }
      }
    }

    stage('Build image') {
      steps {
        sh "docker login"
        sh "docker build . -t williamgillaspy/arm64v8-docker-certbot:latest"
      }
    }

    stage('Push the image.') {
      steps {
        sh "docker push williamgillaspy/arm64v8-docker-certbot:latest";
      }
    }
  }
}
