pipeline {
  agent any

  parameters {
    string (
      name: 'IMAGE',
      defaultValue: 'eclipse-temurin:17-jre',
      description: 'immagine docker per container'
    )

    choice (
      name: 'TOOL',
      choices: ['ansible', 'jenkins', 'nessuno'],
      description: 'scelta per tool all interno del container'
    )

    choice (
      name: 'GPACCHETTI',
      choices: ['apt-get', 'dnf', 'yum', 'apk', 'zypper'],
      description: 'scelta di gestori pacchetti in base all immagine scelta'
    )
  }
  
  stages {

    stage('crea container effimero') {
      steps {
        sh """
          docker run -d --name test-${BUILD_NUMBER} --entrypoint sleep ${params.IMAGE} infinity
          docker ps --filter name=test-${BUILD_NUMBER} 
        """
      }
    }

    stage('installa ansible') {
      when {
        expression { params.TOOL == 'ansible' }
      }
      steps {
        sh """
          docker exec test-${BUILD_NUMBER} ${params.GPACCHETTI} update
          docker exec test-${BUILD_NUMBER} ${params.GPACCHETTI} install -y ansible
        """
      }
    }

    stage('install jenkins') {
      when {
        expression { params.TOOL == 'jenkins' }
      }
      steps {
        sh """
          docker exec test-${BUILD_NUMBER} curl -fsSL -o /opt/jenkins.war https://get.jenkins.io/war-stable/latest/jenkins.war
          docker exec test-${BUILD_NUMBER} ls -lh /opt/jenkins.war
          docker exec -d test-${BUILD_NUMBER} sh -c 'java -jar /opt/jenkins.war > /tmp/jenkins.log 2>&1'
          docker exec test-${BUILD_NUMBER} sleep 30
          docker exec test-${BUILD_NUMBER} cat /tmp/jenkins.log
        """
      }
    }
  }
}