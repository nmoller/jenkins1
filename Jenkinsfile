stage('Build') {
    node {
        docker.withServer('tcp://chaland.si.uqam.ca:2375', 'DockerHost-Chaland') {
            docker.image('nmolleruq/php-git-jenk').withRun('-v $WORKSPACE:/home/jenkins/code') {  
                withCredentials([sshUserPrivateKey(credentialsId: 'git-uqamena-test', keyFileVariable: 'FILE')]) {
                    sh(""" 
                      hostname
                      git config core.sshCommand
                    """)
                }
            }
        }
    }
}