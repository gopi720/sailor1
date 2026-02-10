pipeline{
    agent {
        lable 'slave'
    }
    tools{
        maven 'maven'
    }
    stages{
        stage('checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/gopi720/sailor1.git'
            }
        }
        stage('build'){
            steps{
                sh 'mvn clean verify'
            }
        }
    }
}