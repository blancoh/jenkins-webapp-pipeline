pipeline{
        agent any
                stages {
                       stage('One') {
                               steps {
                                       echo 'Hi, I am cool'
                               }
                        }
                        
                        stage('Two') {
                                steps {
                                        input('Do you want to continue?')
                                }
                         }
                         
                         stage('Three') {
                                 when {
                                         not {
                                               branch "master"
                                         }
                                 }
                                 steps  {
                                          echo "Hello"
                                 }
                         }
