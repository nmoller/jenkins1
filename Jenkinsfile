import groovy.json.JsonSlurper

@NonCPS
def jsonParse(def json) {
    new groovy.json.JsonSlurper().parseText(json)
}

node {

	def components = []
	components << 'blocks_uqinfosperso'
	components << 'local_uqcreecours'
	
	def BRANCH = 'UQAM_31_INT'
	

	stage('Preparer composantes') {
		def json = readFile(file:'../workspace@script/UQAM_30_DEV.json')
	    def data = jsonParse(json)
	    components.each {
	    	def index = data.plugins.findIndexOf { name -> name =~ /${it}/ }
	    	echo "component: ${data.plugins[index].name}"
	    	echo "path     : ${data.plugins[index].dir}"
	    }
	    
	}
	
	
}