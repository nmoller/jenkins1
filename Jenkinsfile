pipeline {
    agent none
	
	stages {
        stage('Example Build') {
            agent {
                docker {
                    image 'nmolleruq/php-git'
                    args '-v $WORKSPACE:/home/uqamena/code'
                }
            }
        	steps {
                sshagent(['git-test']) {
                   sh(""" 
                      echo SSH_AUTH_SOCK=$SSH_AUTH_SOCK
                      mkdir ~/.ssh
                      echo 'Host *\n    StrictHostKeyChecking no' > ~/.ssh/config
                      [ -d '/home/uqamena/code/test01' ] && rm -rf /home/uqamena/code/test01 || echo 'Start'
                      [ -d '/home/uqamena/code/build' ] && rm -rf /home/uqamena/code/build || echo 'Start'
                      git clone git@bitbucket.org:uqam/appbuilder.git /home/uqamena/code/test01
                      php /home/uqamena/code/test01/bin/builder.php gitStuff -r -l -k /home/uqamena/code/test01/config/moodle35-uqam.yml
                      mv *.log build/moodle35
                   """)
                }
            }
        }
    }
}