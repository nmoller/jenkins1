pipeline {
	agent {
	    docker {
	        image 'alpine/git'
	        label 'my-defined-label'
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