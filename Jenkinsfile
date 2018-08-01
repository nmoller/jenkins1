pipeline {

agent {
            docker.withServer('tcp://chaland.si.uqam.ca:2375', 'DockerHost-Chaland') {
                image 'nmolleruq/php-git-jenk' 
                args '-v $WORKSPACE:/home/jenkins/code' 
                label 'builder'
            }
        }

stages{
    stage('Build') {
        agent('builder')
        steps {
           sshagent(['git-uqamena-test']) { 
              sh("""
                whoami
                ls -altr /home/jenkins/code
              """)
           }
        }
    }
}
}