import groovy.json.JsonSlurperClassic

@NonCPS
def jsonParse(def json) {
    new groovy.json.JsonSlurperClassic().parseText(json)
}

node {

	def BRANCH = 'UQAM_31_INT'
	stage('Preparer composantes') {
		def json = readFile(file:'../workspace@script/UQAM_30_DEV.json')
	    def data = new jsonParse(json)
	    echo "color: ${data.plugins[10].name}"
	}
	
	
}