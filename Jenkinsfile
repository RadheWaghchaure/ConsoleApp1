pipeline {
    agent any

    environment {
        BUILD_DIR = 'C:\\Users\\radheshamw\\source\\repos\\ConsoleApp1\\src\\bin\\Release'
        TARGET_DIR = 'D:\\Build Output\\radheshamw'
        RELEASE_DIR = 'D:\\Release Data\\radheshamw'
        EMAIL_RECIPIENTS = 'waghchaureradhesham23@gmail.com'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/RadheWaghchaure/ConsoleApp1', branch: 'main'
            }
        }

        stage('Build with MSBuild') {
            steps {
                bat 'powershell -ExecutionPolicy Bypass -File build/build.ps1'
            }
        }

        stage('Post-Build Deployment') {
            steps {
                bat 'powershell -ExecutionPolicy Bypass -File deploy/post_build.ps1'
            }
        }
    }

    post {
        success {
            emailext (
                to: "${env.EMAIL_RECIPIENTS}",
                subject: "Jenkins Build Success - ConsoleApp1",
                body: "The build completed successfully.",
                attachLog: true
            )
        }
        failure {
            emailext (
                to: "${env.EMAIL_RECIPIENTS}",
                subject: "Jenkins Build Failed - ConsoleApp1",
                body: "The build failed. Please check the logs.",
                attachLog: true
            )
        }
    }
}
