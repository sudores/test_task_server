pipeline {
    agent any
    stages {
        stage("Build") {
            steps {
                script {
                    a = getStartedCommit()
                    echo "$a"
                }
            }
        }
    }

}

String getStartedCommit() {
    String result = sh(
            returnStdout: true,
            script: "git log --pretty=format:'%h'"
            ).trim()
    return result
}
