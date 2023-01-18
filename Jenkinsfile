pipeline {
    agent any
    environment {
	    DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	    CI = true
    }
    stages {
        stage('Build Frontend') {
            steps {
                // Checkout the code from the repository
                git url: 'https://github.com/adeoyedewale/finalclassreview.git'
                sh 'cd frontend && npm install && npm run build'
            }
        }
        stage('Build Backend') {
            steps {
                git url: 'https://github.com/adeoyedewale/finalclassreview.git'
                sh 'cd backend && npm install'
            }
        }
        stage('Build Docker Image') {
            steps {
                // Copy built applications to a temporary directory
                sh 'mkdir -p tmp/frontend'
                sh 'mkdir -p tmp/backend'
                sh 'cp -r frontend/build tmp/frontend'
                sh 'cp -r backend tmp/backend'
                // Build the Docker image
                sh 'docker build -t eruobodo/my-app-image:$BUILD_NUMBER .'
            }
        }
      stage('Publish') {
				steps {
					//sh "docker login -u eruobodo -p Fifehanmi@2021"
						sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login --username eruobodo --password-stdin'
					//sh "docker tag eruobodo/classreview-app:$BUILD_NUMBER eruobodo/classreview-app:$BUILD_NUMBER"
					sh "docker push eruobodo/my-app-image:$BUILD_NUMBER"
				}
		}
    }
  post {
		always {
			cleanWs()
			sh 'docker logout'
		}
	}
}
