#! /bin/bash
# Bash Shell 기반으로 실행함

PROJECT_PATH=$HOME"/wemakeprice/workspace/"
DEV_WEB="web-square"

function removeDocker() {
  for TYPE in $*
  do
    case $TYPE in
      "CONTAINER")
        echo "모든 Docker Container 중지하기"
        docker stop $(docker ps -a -q) 

        echo "모든 Docker Container 삭제하기"
        docker rm $(docker ps -a -q)
        ;;
      "IMAGE")
        echo "모든 Docker 삭제하기"
        docker rmi $(docker images -q)
        ;;
    esac
  done
}

function createDocker() {
  for TYPE in $*
  do
    case $TYPE in
      "IMAGE")
        echo "Ubuntu 이미지 설치하기"
        docker pull ubuntu:latest
      ;;
      "CONTAINER")
        echo "Docker Container 생성하기"
        echo $PROJECT_PATH
        echo $DEV_WEB
        docker run -i -t -d -p 80:80/tcp -v $PROJECT_PATH:/data --name $DEV_WEB ubuntu /bin/bash
      ;;
    esac
  done
  
}

function installServer() {
  for TYPE in $*
  do
    case $TYPE in
      "PLUGIN")
        docker exec $DEV_WEB apt-get update

        docker exec $DEV_WEB apt-get install vim -y

        docker exec $DEV_WEB apt-get install curl -y
      ;;
      "NGINX")
        docker exec $DEV_WEB apt-get install nginx -y

        docker exec $DEV_WEB service nginx start
      ;;
      "JAVA")
        docker exec $DEV_WEB apt-get install software-properties-common -y

        docker exec $DEV_WEB add-apt-repository ppa:webupd8team/java

        docker exec $DEV_WEB apt-get update

        docker exec $DEV_WEB apt-get install default-jdk -y

        # docker exec $DEV_WEB apt-get install oracle-java8-installer -y
        # docker exec $DEV_WEB apt-get install oracle-java8-set-default -y
      ;;
    esac
  done
}

removeDocker CONTAINER IMAGE

createDocker IMAGE CONTAINER

installServer PLUGIN NGINX JAVA