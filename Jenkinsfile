pipeline {
  agent {
      label 'jenkins-bc-did'
  }
 triggers {
       pollSCM('H 5 * * 1')
 }
 stages {
    stage('Build image') {
      steps {

        sh """
             unset DOCKER_HOST
             unset DOCKER_TLS_VERIFY
             docker build . -t ${REGISTRY_IP_AND_PORT}/arm64v8-docker-certbot:latest
             docker push ${REGISTRY_IP_AND_PORT}/arm64v8-docker-certbot:latest
           """
      }
    }
  }
}
