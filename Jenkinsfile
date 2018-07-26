pipeline {
    agent none
	
	stages {
        stage('Example Build') {
            agent {
                docker {
                    image 'nmolleruq/php-git'
                    args '-v $WORKSPACE:/home/nmoller/code'
                }
            }
        	steps {
                sshagent(['git-test']) {
                   sh(""" 
                      echo SSH_AUTH_SOCK=$SSH_AUTH_SOCK
                      mkdir ~/.ssh
                      echo 'Host *\n    StrictHostKeyChecking no' > ~/.ssh/config
                      [ -d '/home/nmoller/code/test01'] && rm -f /home/nmoller/code/test01 || echo 'Start'
                      git clone git@bitbucket.org:uqam/moo-inscriptions.git /home/nmoller/code/test01
                   """)
                }
            }
        }
    }
}