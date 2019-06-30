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

                        stage('Four') {
                                parallel {
                                        stage('Unit Test') {
                                                steps {
                                                        echo "Running unit test..."
                                                }
                                        }
                                        stage('Integration test') {
                                                agent {
                                                        docker {
                                                                reuseNode false
                                                                image 'ubuntu'
                                                        }
                                                }
                                                steps {
                                                        echo 'Running integration test...'
                                                }
                                        }
                                }
                        }
                }
}
