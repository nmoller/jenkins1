import groovy.json.JsonSlurper

@NonCPS
def jsonParse(def json) {
    new groovy.json.JsonSlurper().parseText(json)
}

@NonCPS
def treatComponents(def components) {
	def json = readFile(file:'../workspace@script/UQAM_30_DEV.json')
	def data = jsonParse(json)
	components.each {

    	def index = data.plugins.findIndexOf { name -> name =~ /${it}/ }
    	sh('echo "component: ${data.plugins[index].name}")
    	def path = ${data.plugins[index].dir}
    	sh('echo "path     : ${path}"')
    	//sh("rm -rf \$WORKSPACE/moodle/${path}")
    }
}

@NonCPS
def setComponents() {
	def components = []
	// On ajoute les composantes a modifier
	components << 'blocks_uqinfosperso'
	components << 'local_uqcreecours'
	return components
}

node {
	def BRANCH_M = 'UQAM_31_INT'
	
}



pipeline {
	agent any

    stages {
        /*
    	stage('Copier la version de moodle') {
    		steps {
    			dir('moodle') {
					checkout scm: [$class: 'GitSCM', 
					userRemoteConfigs: [[url: 'https://bitbucket.org/uqam/moodle.git', 
					credentialsId: 'uqamena-BB']], 
					branches: [[name: "${BRANCH_M}"]]
					], poll: false
				}
    		}
		    
		}
		*/
	

		stage('Preparer composantes') {
			steps {
			   treatComponents(setComponents()) 
		    }
		    
		}
    }
	
}