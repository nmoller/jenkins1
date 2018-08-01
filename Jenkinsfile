stage('Build') {
    node {
        docker.withServer('tcp://chaland.si.uqam.ca:2375', 'DockerHost-Chaland') {
            docker.image('nmolleruq/php-git').withRun('-v $WORKSPACE:/home/uqamena/code') {  
                withCredentials([file(credentialsId: 'git-uqamena-test', variable: 'FILE')]) {
                    sh(""" 
                      cat $FILE
                      ls -altr /home
                      whoami
                    """)
                }
            }
        }
    }
}