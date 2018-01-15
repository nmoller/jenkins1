#!/usr/bin/env groovy

import groovy.json.JsonSlurper

@NonCPS
def jsonParse(def json) {
    new groovy.json.JsonSlurper().parseText(json)
}


def treatComponents(def components) {
	def json = readFile(file:'UQAM_30_DEV.json')
	//def json = readJSON file: 'UQAM_30_DEV.json'
	def data = jsonParse(json)
	components.each {

    	def index = data.plugins.findIndexOf { name -> name =~ /${it}/ }
    	echo "component: ${data.plugins[index].name}"
    	def path = "${data.plugins[index].dir}"
    	echo "path     : ${path}"
    	path = "${env.WORKSPACE}/moodle/" + "${path}"
    	echo "${path}"
    	dir ("${path}") {
    		deleteDir
    	}
    }
}


def setComponents() {
	def components = []
	// On ajoute les composantes a modifier
	components << 'blocks_uqinfosperso'
	components << 'local_uqcreecours'
	return components
}


pipeline {
	agent any

	environment {
        BRANCH_M = 'UQAM_31_INT'
    }

    stages {
    	stage('Copier la version de moodle') {
    		steps {
    			dir('moodle') {
					checkout scm: [$class: 'GitSCM',
					userRemoteConfigs: [[url: 'https://bitbucket.org/uqam/moodle.git',
					credentialsId: 'uqamena-BB']],
					branches: [[name: "${env.BRANCH_M}"]]
					], poll: false
				}
    		}
		}


		stage('Preparer composantes') {
			steps {
			   treatComponents(setComponents())
		    }
		}
    }
}