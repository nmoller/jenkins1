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

	    def index = data.plugins.findIndexOf { name -> name =~ /blocks_uqinfosperso/ }
	    echo "component: ${data.plugins[index].name}"
	}
	
	
}