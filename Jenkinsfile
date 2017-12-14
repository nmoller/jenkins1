node {


	stage('Preparer composantes') {
		dir(repport_lpmonitoring) {
			// Chercher une tag en particulier:
			checkout scm: [$class: 'GitSCM', 
				userRemoteConfigs: [[url: 'https://bitbucket.org/uqam/report_lpmonitoring.git', 
				credentialsId: 'uqamena-BB']], 
				branches: [[name: 'v1.0.0']]
				], poll: false
		}
	}
	
	
	
	stage('Build image') {
		sh("echo 'DONE'")
	}
	
}