pipeline {
    agent any
    environment {
        USER         = "vepl"
        IMAGE_NAME   = "test-task-client"
        COMMIT       = ""
    }
    stages {
        stage("Need") {
            steps {
                echo 'environment is done, need is runing'
                env.COMMIT = getStartedCommit()
                echo "USER $USER"
                echo "IMAGE_NAME $IMAGE_NAME"
                echo "COMMIT $COMMIT"
            }
        }
        stage("Build") {
            steps {
                script {
                    def img = docker.build("$USER/$IMAGE_NAME:$COMMIT", ".")
                    img.push()
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
