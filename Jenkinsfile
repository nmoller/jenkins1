stage('Build') {
    node {
        docker.withServer('tcp://chaland.si.uqam.ca:2375', 'DockerHost-Chaland') {
            docker.image('nmolleruq/php-git').withRun('-v $WORKSPACE:/home/uqamena/code') {  
                withCredentials([sshUserPrivateKey(credentialsId: 'git-uqamena-test', keyFileVariable: 'FILE')]) {
                    sh(""" 
                      printenv
                      git clone git@bitbucket.org:uqam/mod_uqamvideo.git ~/workspace/ENA-build-pipeline/test01
                      ls -altr ~/workspace/ENA-build-pipeline
                    """)
                }
            }
        }
    }
}