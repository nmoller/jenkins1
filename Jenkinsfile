pipeline {
	agent {
	    docker {
	        image 'alpine/git'
	        args  '--entrypoint "/bin/sh"'
	    }
	}
	stages {
        stage('Example Build') {
        	steps {
                sh "echo 'Hello, Test'"
            }
        }
    }
}