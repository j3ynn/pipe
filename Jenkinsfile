pipeline {
  agent any

  parameters {
    string (
      name: 'IMAGE',
      defaultValue: 'ubuntu:22.04',
      description: 'immagine docker per container'
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
  }
}