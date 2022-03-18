pipeline {
    agent any
    environment {
        USER         = "vepl"
        IMAGE_NAME   = "test-task-server"
        COMMIT       = ""
    }
    stages {
        stage("Need") {
            steps {
                script {
                    echo 'environment is done, need is runing'
                    COMMIT = getStartedCommit()
                    echo "USER $USER"
                    echo "IMAGE_NAME $IMAGE_NAME"
                    echo "COMMIT $COMMIT"
                }
            }
        }
        stage("Build") {
            steps {
                script {
                    img = docker.build("$USER/$IMAGE_NAME:$COMMIT", ".")
                }
           } 
        }
        stage("Deploy") {
            steps {
                script {
                    img.push()
                    img.push("latest")
                }
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
