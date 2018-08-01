stage('Build') {
    node {
        docker.withServer('tcp://chaland.si.uqam.ca:2375', 'DockerHost-Chaland') {
            docker.image('nmolleruq/php-git').withRun('-v $WORKSPACE:/home/uqamena/code') {  
                /* do things */
                sshagent(['git-uqamena-test']) {
                    sh(""" 
                      echo SSH_AUTH_SOCK=$SSH_AUTH_SOCK
                      ls -altr /home
                      whoami
                    """)
                }
            }
        }
    }
}