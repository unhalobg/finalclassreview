pipeline {
    agent any
  
    environment {
	    DOCKERHUB_CREDENTIALS=credentials('dockerhub')
    }

    stages {
      stage('Checkout Code') {
            steps {
                // Checkout the code from the repository
                git url: 'https://github.com/adeoyedewale/finalclassreview.git'
            }
        }
	    
	stage('Build Backend') {
            steps {
		sh 'cd backend'
		sh 'npm ci'
                sh 'npm install'
            }
        }
	    
	stage('Build Frontend') {
            steps {
		sh 'cd frontend'
		sh 'npm ci'
                sh 'npm install'
		sh 'npm run build'
            }
        }
	
	stage('Create Docker Image') {
	    steps {
		sh 'docker build -t eruobodo/myximage:$BUILD_NUMBER .'
	    }
	}
	    
        //stage('Build') {
        //    steps{
        //        sh 'docker-compose build'
        //    }
       // }
        stage('Push') {
            steps {
              withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                //sh 'docker-compose push myapp'
		sh 'docker push eruobodo/myximage:$BUILD_NUMBER'
              }
            }
        }
    }
} 
