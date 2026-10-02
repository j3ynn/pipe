pipeline {
  agent any

  parameters {
    string (
      name: 'IMAGE',
      defaultValue: 'ubuntu:22.04',
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
        expression { params.TOOL == 'ansible'}
      }
      steps {
        sh """
          docker exec test-${BUILD_NUMBER} ${params.GPACCHETTI} update
          docker exec test-${BUILD_NUMBER} ${params.GPACCHETTI} install -y ansible
        """
      }
    }
  }
}