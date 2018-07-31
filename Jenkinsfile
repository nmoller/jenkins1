pipeline {
    agent none
	withDockerServer([credentialsId: 'DockerHost-Chaland', uri: 'tcp://chaland.si.uqam.ca:2375']) 
	stages {
        stage('Example Build') {
            agent {
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