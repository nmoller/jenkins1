import groovy.json.JsonSlurper
@NonCPS
def jsonParse(def json) {
    new groovy.json.JsonSlurper().parseText(json)
}

node {

	def BRANCH = 'UQAM_31_INT'
	stage('Preparer composantes') {
		def json = readFile(file:'../workspace@script/UQAM_30_DEV.json')
	    def data = jsonParse(json)
	    echo "color: ${data.plugins[10].name}"
	}
	
	
}