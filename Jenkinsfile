pipeline {
  agent any
  stages {
     stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t bhargava1/hellowhale:latest .'
      }
    }
    stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push bhargava1/hellowhale:latest'
        }
      }
    }
    stage('Kubernetes Deploy') {
      agent any
      steps {
        sh 'kubectl get pods'
      
      }
    }
  }
}
