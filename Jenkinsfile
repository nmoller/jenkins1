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
        stage('Tests'){
            agent any
            environment { 
                MOODLE_DOCKER_WWWROOT = "${WORKSPACE}/build/moodle35"
                MOODLE_DOCKER_DB = 'mysql'
            }
            steps{
                sh("""
                [ -d "${WORKSPACE}/compose-bin" ] || git clone git@github.com:moodlehq/moodle-docker.git compose-bin
                cp compose-bin/config.docker-template.php $MOODLE_DOCKER_WWWROOT/config.php
                compose-bin/bin/moodle-docker-compose up -d
                compose-bin/bin/moodle-docker-compose exec -T --user 127 webserver php admin/tool/behat/cli/init.php
                compose-bin/bin/moodle-docker-compose exec -T --user 127 webserver php admin/tool/behat/cli/run.php --tags=@auth_manual
                ${WORKSPACE}/compose-bin/bin/moodle-docker-compose down
                """)
            }

            post {
                always{
                   sh("""
                   compose-bin/bin/moodle-docker-compose down
                   """)
                }
            }
        }

    }
}