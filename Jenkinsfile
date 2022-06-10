
    //pipeline to install apache and deploy index.html
currentBuild.displayName = "Git-pipeline-#"+currentBuild.number
pipeline {
  agent any
  environment{
      DOCKER_TAG = getDockerTag()
  }
      stages {
     	    stage('Build Docker Image'){
     	        steps{
     	            sh "docker build . -t mohan03/sac:${DOCKER_TAG}"
     	        }
     	    }
			stage('DockerHube Push'){
			    steps{
			    withCredentials([string(credentialsId: 'docker_hub', variable: 'docker_HubPwd')]) {
                    sh "docker login -u mohan03 -p ${docker_HubPwd}"
                    sh "docker push mohan03/sac:${DOCKER_TAG}"
			    }
			    }
			    
			  }
               }
          }
                                def getDockerTag(){
			        def tag = sh script: 'git rev-parse HEAD', returnStdout: true
			        return tag
			    }
 			
		    
