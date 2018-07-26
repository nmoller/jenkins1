pipeline {
	agent {
	    dockerfile true
	}
	stages {
        stage('Example Build') {
        	steps {
                sh "hostname -s"
                sshagent(['git-test']) {
                   sh 'echo SSH_AUTH_SOCK=$SSH_AUTH_SOCK'
                   sh 'ls -al $SSH_AUTH_SOCK || true'
                   sh 'git clone git@bitbucket.org:uqam/moo-inscriptions.git'
                }
            }
        }
    }
}