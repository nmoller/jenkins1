pipeline {
    agent none
	 
	stages {
        stage('Example Build') {
            agent {
                    docker.withServer([credentialsId: 'DockerHost-Chaland', uri: 'tcp://chaland.si.uqam.ca:2375']) { 
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