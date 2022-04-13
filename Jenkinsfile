def STAMP = new Date().format('yyyyMMdd') + '-' + currentBuild.number

pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
    }
    environment {
        SRC_URL = 'https://github.com/crithead/range'
        NEXUS_URL = 'http://nexus:8081/repository/crithead/range'
        NEXUS_CREDS = credentials('jenkins-nexus-login')
        //VERSION = "1.0.0.${env.BUILD_NUMBER}"
        //TODO Figure out how to inject this into the CMake build
        //TODO or extact it from CMake
        VERSION = "1.0.0"
        DIST_FILE = "range_${VERSION}_amd64.deb"
    }
    stages {
        stage('Configure') {
            steps {
                sh 'rm -fr build'
                sh 'mkdir build'
                dir ('build') {
                    sh 'cmake ..'
                }
            }
        }
        stage('Build') {
            steps {
                dir ('build') {
                    sh 'make range'
                }
            }
        }
        stage('Run CppCheck') {
            steps {
                sh 'cppcheck --xml --xml-version=2 src 2> cppcheck.xml'
            }
        }
        stage('Manual') {
            steps {
                dir ('build') {
                    sh 'make manual'
                }
            }
        }
        stage('Package') {
            steps {
                dir ('build') {
                    sh 'make package'
                }
            }
        }
        stage('Publish') {
            steps {
                script {
                    sh "curl --silent --fail --user '${NEXUS_CREDS}'" +
                       " --upload-file build/${DIST_FILE}" +
                       " ${NEXUS_URL}/${STAMP}/${DIST_FILE}"
                }
            }
        }
    }
    post {
        always {
            recordIssues enabledForFailure: true, tool: cppCheck(pattern: 'cppcheck.xml')
        }
    }
}

