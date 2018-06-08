pipeline {
  agent any
  stages {
     stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t manojnaladala/devops:${BUILD_NUMBER} .'
        sh 'echo ${BUILD_NUMBER}'
      }
    }
    stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'Docker', passwordVariable: 'DockerPassword', usernameVariable: 'DockerUser')]) {
          sh "docker login -u ${env.DockerUser} -p ${env.DockerPassword}"
          sh 'docker push manojnaladala/devops:${BUILD_NUMBER}'
        }
      }
    }
    stage('Kubernetes Deploy') {
      agent any
      steps {
        // sh '/var/lib/jenkins/google-cloud-sdk/bin/kubectl get pods'
        //sh 'kubectl version'
        sh '~/google-cloud-sdk/bin/kubectl version'
        sh '~/google-cloud-sdk/bin/kubectl set image deployment/hellowhale-deployment manojnaladala/devops:29=manojnaladala/devops:${BUILD_NUMBER}'
       // sh '~/google-cloud-sdk/bin/kubectl apply -f manifest/hellowhale-deployment.yaml'
        
      }
    }
  }
}
