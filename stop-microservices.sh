sh 'docker stop $(docker ps -q --filter ancestor=frontend:latest)'
sh 'docker stop $(docker ps -q --filter ancestor=backend:latest)'
sh 'docker rm $(docker ps -a -q --filter ancestor=frontend:latest)'
sh 'docker rm $(docker ps -a -q --filter ancestor=backend:latest)'
