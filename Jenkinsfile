/*pipeline {

    agent any
    
    environment {
      project = "deveops"
      module = "angular"
      registry = "debopsc"
    }
  

    stages {
    
      stage("build image") {
        steps{
          sh "docker build -t ${env.project}/${env.module}:${BRANCH_NAME} ."
        }
        }
      stage("build push") {
        steps{
          withCredentials([usernamePassword(credentialsId: "DockerHub", passwordVariable: password, usernameVarable: "username")]){
            sh "docker login --username $username --password $password"
          }
          sh "docker push ${env.project}/${env.module}:${BRANCH_NAME} ."
        }

        }
       stage("deploy") {
        steps{
          withCredentials([usernamePassword(credentialsId: "DockerHub", passwordVariable: password, usernameVarable: "username")]){
            sh "docker stop deploy || echo 0"
            sh "docker run -d --rm --name deploy -p 80:80 ${env.project}/${BRANCH_NAME}"
            sh '''docker rmi $(docker images | tail /n +2 | awk '\$1 === "<none>" {print \$'3'}') -f || echo 0 '''
        }
        
        }
          
     }
   }
}*/

pipeline {
    agent any 
    environment {
    DOCKERHUB_CREDENTIALS = credentials('calacaba-dockerhub')
    }
    stages { 
        stage('SCM Checkout') {
            steps{
            git 'https://github.com/calacaba/Angular-Jenkins.git'
            }
        }

        stage('Build docker image') {
            steps {  
                sh 'docker build -t calacaba/nodeapp:$BUILD_NUMBER .'
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh 'docker push valaxy/nodeapp:$BUILD_NUMBER'
            }
        }
}
post {
        always {
            sh 'docker logout'
        }
    }
}