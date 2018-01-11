import groovy.json.JsonSlurper

@NonCPS
def jsonParse(def json) {
    new groovy.json.JsonSlurper().parseText(json)
}


pipeline {

	def components = []
	// On ajoute les composantes a modifier
	components << 'blocks_uqinfosperso'
	components << 'local_uqcreecours'

	def BRANCH_M = 'UQAM_31_INT'
	def json = readFile(file:'../workspace@script/UQAM_30_DEV.json')
	def data = jsonParse(json)
    stages {
    	stage('Copier la version de moodle') {
		     //dir('moodle') {
				/*
				checkout scm: [$class: 'GitSCM', 
					userRemoteConfigs: [[url: 'https://bitbucket.org/uqam/moodle.git', 
					credentialsId: 'uqamena-BB']], 
					branches: [[name: "${branch}"]]
					], poll: false
					*/
				echo "${BRANCH_M}"
			//}
		}
	

		stage('Preparer composantes') {
			
		    components.each {

		    	def index = data.plugins.findIndexOf { name -> name =~ /${it}/ }
		    	echo "component: ${data.plugins[index].name}"
		    	def path = ${data.plugins[index].dir}
		    	echo "path     : ${path}"
		    	//sh("rm -rf \$WORKSPACE/moodle/${path}")
		    }
		    
		}
    }
	
}