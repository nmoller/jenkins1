pipeline {
    agent none
	
	stages {
        stage('Example Build') {
            agent {
                withDockerServer([credentialsId: 'DockerHost-Chaland', uri: 'tcp://chaland.si.uqam.ca:2375']) {
                    docker {
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
}