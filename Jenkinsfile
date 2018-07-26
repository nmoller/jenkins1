pipeline {
	agent {
	    docker {
	        image 'alpine/git'
	        label 'my-defined-label'
	        args  '--entrypoint "/bin/ls"'
	    }
	}
}