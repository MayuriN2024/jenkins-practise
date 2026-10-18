
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Create Dockerfile') {
            steps {
                sh '''
                    cat > Dockerfile <<'EOF'
                    FROM nginx:alpine
                    COPY index.html /usr/share/nginx/html/index.html
                    EXPOSE 80
                    EOF
                '''
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker build -t hello-world-app:${BUILD_NUMBER} .'
            }
        }

        stage('Deploy Container') {
            steps {
                sh '''
                    docker rm -f hello-world-app || true

                    docker run -d \
                      --name hello-world-app \
                      --restart unless-stopped \
                      -p 8081:80 \
                      hello-world-app:${BUILD_NUMBER}
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                    sleep 3
                    docker ps --filter name=hello-world-app
                    curl -fsS http://localhost:8081/
                '''
            }
        }
    }
}
