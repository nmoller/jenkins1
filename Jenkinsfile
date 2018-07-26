pipeline {
	agent {
	    docker {
	        image 'alpine/git'
	        args  '--entrypoint "/bin/ls"'
	    }
	}
	stages {
        stage('Example Build') {
        	steps {
                echo 'Hello, Test'
            }
        }
    }
}