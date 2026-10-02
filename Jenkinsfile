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
      name: 'G-PACCHETTI',
      choices: ''
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
        echo 'gg'
      }
    }
  }
}