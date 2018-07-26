pipeline {
	agent {
        label 'git-builder'
        docker {
            image 'alpine/git'
            args '-v $WORKSPACE:/home/nmoller/code'
        }
    }
	stages {
        stage('Example Build') {
            agent{ node {label 'git-builder' } }
        	steps {
                sh "useradd -u 127 nmoller"
                sshagent(['git-test']) {
                   sh(""" 
                      echo SSH_AUTH_SOCK=$SSH_AUTH_SOCK
                      mkdir ~/.ssh
                      echo 'Host *\n    StrictHostKeyChecking no' > ~/.ssh/config
                      ls -al $SSH_AUTH_SOCK || true
                      git clone git@bitbucket.org:uqam/moo-inscriptions.git
                   """)
                }
            }
        }
    }
}