pipeline {
	agent {
	    dockerfile true
	}
	stages {
        stage('Example Build') {
        	steps {
                sh "hostname -s"
                sshagent(['git-test']) {
                   sh(""" 
                      echo SSH_AUTH_SOCK=$SSH_AUTH_SOCK
                      mkdir ~/.ssh
                      echo 'Host *\n    StrictHostKeyChecking no' > ~/.ssh/config
                      ls -al $SSH_AUTH_SOCK || true
                      su -p -s /bin/bash -c 'git clone git@bitbucket.org:uqam/moo-inscriptions.git' nmoller
                   """)
                }
            }
        }
    }
}