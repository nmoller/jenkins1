pipeline {
    agent none
	 
	stages {
        stage('Example Build') {
            agent {
                    docker.withDockerServer([credentialsId: 'test-id', uri: 'tcp://chaland.si.uqam.ca:2375']) { 
                        docker {
                            image 'nmolleruq/php-git'
                            args '-v $WORKSPACE:/home/uqamena/code'
                        }
                    }
            }
            
        	steps {
                sh(""" 
                  ls -altr
                  whoami
                """)
            }
            

        }
    }
}