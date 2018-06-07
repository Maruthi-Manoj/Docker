pipeline {
  agent any
  stages {
     stage('Docker Build') {
      agent any
      steps {
        sh 'whoami'
        sh 'pwd'
        sh 'docker build -t manojnaladala/devops:latest .'
      }
    }
    stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'Docker', passwordVariable: 'DockerPassword', usernameVariable: 'DockerUser')]) {
          sh "docker login -u ${env.DockerUser} -p ${env.DockerPassword}"
          sh 'docker push manojnaladala/devops:latest'
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
