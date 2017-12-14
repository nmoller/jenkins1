node {


	stage('Preparer composantes') {
		dir('repport_lpmonitoring') {
			// Chercher une tag en particulier:
			checkout scm: [$class: 'GitSCM', 
				userRemoteConfigs: [[url: 'https://bitbucket.org/uqam/report_lpmonitoring.git', 
				credentialsId: 'uqamena-BB']], 
				branches: [[name: 'v1.0.0']]
				], poll: false
		}
		dir('moodle') {
			checkout scm: [$class: 'GitSCM', 
				userRemoteConfigs: [[url: 'https://bitbucket.org/uqam/moodle.git', 
				credentialsId: 'uqamena-BB']], 
				branches: [[name: 'UQAM_31_INT']]
				], poll: false
		}
		sh("rm -rf \$WORKSPACE/report_lpmonitoring/.git")
		sh("rm -rf \$WORKSPACE/moodle/report/lpmonitoring")


	}
	
	
	
	stage('Build image') {
		sh("echo 'DONE'")
	}
	
}