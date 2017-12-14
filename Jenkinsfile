node {
	
	def COMMITMSG='Correction de la version du composant report_lpmonitoring'
	def BRANCH='UQAM_31_INT'

	

	stage('Preparer composantes') {
		dir('report_lpmonitoring') {
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
				branches: [[name: "${BRANCH}"]]
				], poll: false
		}

	}
	
	
	
	stage('Build image') {
		withCredentials([usernamePassword(credentialsId: 'uqamena-BB', usernameVariable: 'BB_USER', passwordVariable: 'BB_PASS')]) {
	 
			sh("rm -rf \$WORKSPACE/report_lpmonitoring/.git")
			sh("rm -rf \$WORKSPACE/moodle/report/lpmonitoring")
			sh("cp -r \$WORKSPACE/report_lpmonitoring \$WORKSPACE/moodle/report/lpmonitoring")
			//We retrograde without a new installation
			sh('sed -i "s#2016102600#2016111700#" \$WORKSPACE/moodle/report/lpmonitoring/version.php')
			sh('''
				cd \$WORKSPACE/moodle
				git add --all report/lpmonitoring 
				# Nettoyage
				rm -rf \$WORKSPACE/component
				git commit -m "${COMMITMSG}"
				git remote add bb https://\$BB_USER:\$BB_PASS@bitbucket.org/uqam/moodle.git

				if [ "${CLONE_BRANCH}"  != "${BRANCH}" ]
				then
				    git checkout -b ${BRANCH}
				fi
				git push bb ${BRANCH}:${BRANCH}
			''')

			sh("echo 'DONE'")
		}
	}
	
	
}