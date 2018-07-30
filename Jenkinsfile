pipeline {
    agent none
	
	stages {
        stage('Example Build') {
            agent {
                docker {
                    image 'nmolleruq/php-git'
                    args '-v $WORKSPACE:/home/nmoller/code'
                }
            }
        	steps {
                sshagent(['git-test']) {
                   sh(""" 
                      echo SSH_AUTH_SOCK=$SSH_AUTH_SOCK
                      mkdir ~/.ssh
                      echo 'Host *\n    StrictHostKeyChecking no' > ~/.ssh/config
                      [ -d '/home/nmoller/code/test01' ] && rm -rf /home/nmoller/code/test01 || echo 'Start'
                      [ -d '/home/nmoller/code/build' ] && rm -rf /home/nmoller/code/build || echo 'Start'
                      git clone git@bitbucket.org:uqam/appbuilder.git /home/nmoller/code/test01
                      php /home/nmoller/code/test01/bin/builder.php gitStuff -r -l -k /home/nmoller/code/test01/config/moodle35-uqam.yml
                      mv *.log build/moodle35
                   """)
                }
            }
        }
    }
}