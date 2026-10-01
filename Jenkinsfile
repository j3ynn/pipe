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
          docker run -d --name c-effimero-${BUILD_NUMBER} --entrypoint sleep ${params.IMAGE} infinity
          docker ps --filter name=c-effimero-${BUILD_NUMBER} 
        """
      }
    }
  }
}