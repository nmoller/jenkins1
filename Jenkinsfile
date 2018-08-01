stage('Build') {
    node {
    sshagent(['git-uqamena-test']) {
        docker.withServer('tcp://chaland.si.uqam.ca:2375', 'DockerHost-Chaland') {
            docker.image('nmolleruq/php-git').withRun('-v $WORKSPACE:/home/uqamena/code') {  
                /* do things */
                
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