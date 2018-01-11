import groovy.json.JsonSlurper

@NonCPS
def jsonParse(def json) {
    new groovy.json.JsonSlurper().parseText(json)
}

node {

	def BRANCH = 'UQAM_31_INT'
	def component = ('blocks_uqinfosperso', 
	    'local_uqcreecours')

	stage('Preparer composantes') {
		def json = readFile(file:'../workspace@script/UQAM_30_DEV.json')
	    def data = jsonParse(json)
	    components.each {
	    	def index = data.plugins.findIndexOf { name -> name =~ /${component}/ }
	    	echo "component: ${data.plugins[index].name}"
	    	echo "path     : ${data.plugins[index].dir}"
	    }
	    
	}
	
	
}