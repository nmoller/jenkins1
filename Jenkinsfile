node {
    stages {
        stage('Example Build') {
        docker.withServer('tcp://chaland.si.uqam.ca:2375', 'DockerHost-Chaland') {
            docker.image('nmolleruq/php-git').withRun('-v $WORKSPACE:/home/uqamena/code') {
                
            
                        /* do things */
                        sh(""" 
                              ls -altr /home/uqamena/code
                              whoami
                              echo $UID
                        """)
                    }
        }
        }
    }
}


/*
pipeline {
    agent none
	 
	stages {
        stage('Example Build') {
            agent {
                docker {
                    withDockerServer([credentialsId: 'test-id', uri: 'tcp://chaland.si.uqam.ca:2375'])
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
*/