
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
                    sh "docker push mohan03/sac ${DOCKER_TAG}"
			    }
			    }
			    
			     }
			
		    stage ('install-apache') {
					steps {
					 sh "sudo yum install httpd -y"
					}
			    
			}
		
			stage ('start-apache') {
					steps {
							sh "sudo service httpd start"
					}
			}
			
			stage ('check-status') {
					steps {
							sh "sudo service httpd status"
					}
			}
			
			stage ('deploy-index.html') {
					steps {
							sh "echo 'HELLO WORLD' >> index.html"
							sh "sudo cp -r index.html /var/www/html/"
					}
			
			
			}
		
			
			 stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
    
        stage('git') {
            steps {
             sh 'yum install git -y'
            }
        

        }
    }
}
