pipeline {
    agent any
    environment {
        COMMIT = ""
    }
    stages {
        stage("Need") {
            steps {
                script {
                    echo 'environment is done, need is runing'
                    COMMIT = getStartedCommit()
                    echo "COMMIT $COMMIT"
                }
            }
        }
        stage("BUILD") {
            steps {
                echo "COMMIT $COMMIT"
            }
        }
    }
}

// Get commit id which triggered build 
String getStartedCommit() {
    String result = sh(
            returnStdout: true,
            script: "git log -1 --pretty=format:'%h'"
            ).trim()
    return result
}
