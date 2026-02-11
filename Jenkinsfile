pipeline{
    agent {
        label 'slave'
    }
    tools{
        maven 'maven'
    }
    environment{
        branch = "main"
    }
    parameters{
        string 'TARGET_BRANCH'
        choice choices:['main', 'dev', 'test'], name: 'BUILD_BRANCH'
    }
    stages{
        stage('checkout'){
            steps{
                echo "${branch}"
                git branch: params.BUILD_BRANCH, url: 'https://github.com/gopi720/sailor1.git'
            }
        }
        stage('build'){
            steps{
                sh 'mvn clean verify'
            }
        }
        stage('downloading_tomcat'){
            steps{
                sh 'wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.115/bin/apache-tomcat-9.0.115.tar.gz'
                sh 'tar -xzvf apache-tomcat-9.0.115.tar.gz'
            }
        }
        stage('deploying to tomcat'){
            when{
                expression {
                    paramas.TARGET_BRANCH == 'main'
                }
            }
            steps{
                sh 'cp target/speed.war apache-tomcat-9.0.115/webapps/'
            }
        }
        stage('stating tomcat'){
            steps{
                sh 'apache-tomcat-9.0.115/bin/startup.sh'
            }
        }
    }
}