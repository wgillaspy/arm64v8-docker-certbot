pipeline {
  agent {
      label 'jenkins-bc-did'
  }
 triggers {
       pollSCM('H 5 * * 1')
 }
 environment {
        DOCKER_HOST = ""
        DOCKER_TLS_VERIFY = ""
 }
 stages {


    stage('Build image') {
      steps {
        sh "docker build . -t ${REGISTRY_IP_AND_PORT}/arm64v8-docker-certbot:latest"
      }
    }

    stage('Push the image.') {
      steps {
        sh "docker push ${REGISTRY_IP_AND_PORT}/arm64v8-docker-certbot:latest";
      }
    }
  }
}
