pipeline {
    agent none
	 
	stages {
        stage('Example Build') {
            agent {
                    docker.withServer('tcp://chaland.si.uqam.ca:2375', 'DockerHost-Chaland') { 
                        image 'nmolleruq/php-git'
                        args '-v $WORKSPACE:/home/uqamena/code'
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