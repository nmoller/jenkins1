node {
    docker.withServer('tcp://chaland.si.uqam.ca:2375', 'DockerHost-Chaland') {
        docker.image('nmolleruq/php-git').withRun('-v $WORKSPACE:/home/uqamena/code') {  
            /* do things */
            sh(""" 
                  ls -altr /home
                  whoami
            """)
        }
    }
}