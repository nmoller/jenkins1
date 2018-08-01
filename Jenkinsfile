stage('Build') {
    node {
        docker.withServer('tcp://chaland.si.uqam.ca:2375', 'DockerHost-Chaland') {
            image 'nmolleruq/php-git-jenk' 
            args '-v $WORKSPACE:/home/jenkins/code' {  
                withCredentials([sshUserPrivateKey(credentialsId: 'git-uqamena-test', keyFileVariable: 'FILE')]) {
                    sh(""" 
                      FILE=${FILE}
                      whoami
                      ls -altr /home/jenkins/code
                    """)
                }
            }
        }
    }
}