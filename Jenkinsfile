stage('Build') {
    node {
        withCredentials([sshUserPrivateKey(credentialsId: 'git-uqamena-test', keyFileVariable: 'FILE')]) {
        docker.withServer('tcp://chaland.si.uqam.ca:2375', 'DockerHost-Chaland') {
            docker.image('nmolleruq/php-git-jenk').withRun('-e TEST=tutu') {  
                    sh(""" 
                     echo $TEST
                      hostname
                      git config --global core.sshCommand "ssh -i ${FILE} -F /dev/null"
                      git config --get core.sshCommand
                      /usr/local/bin/php -v
                    """)
                }
            }
        }
    }
}