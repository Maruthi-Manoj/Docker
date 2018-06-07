pipeline {
  agent any
  stages {
     stage('Docker Build') {
      agent any
      steps {
        sh 'whoami'
        sh 'pwd'
        sh 'docker build -t manojnaladala/hellowhale:latest .'
      }
    }
    stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'Docker', passwordVariable: 'DockerPassword', usernameVariable: 'DockerHUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push manojnaladala/hellowhale:latest'
        }
      }
    }
   /* stage('Kubernetes Deploy') {
      agent any
      steps {
        sh '/var/lib/jenkins/google-cloud-sdk/bin/kubectl get pods'
        sh 'kubectl get pods'
      }
    }*/
  }
}
