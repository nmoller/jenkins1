import groovy.json.JsonSlurperClassic

node {

	def BRANCH = 'UQAM_31_INT'
	stage('Preparer composantes') {
		def json = readFile(file:'UQAM_30_DEV.json')
	    def data = new JsonSlurperClassic().parseText(json)
	    echo "color: ${data.plugins[10].name}"
	}
	
	
}