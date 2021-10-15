#!/bin/bash

BUILD_ID=$(date +%b%d-%H%M)
case $1 in
    "backend")
    docker-compose --project-name=$BUILD_ID-oral up --no-color --no-start --build $1
    docker stop $(docker ps -f name=oral_$1 -q)
    docker-compose --project-name=$BUILD_ID-oral start $1
    ;;
    "admin")
    docker-compose --project-name=$BUILD_ID-oral up --no-color --no-start --build $1
    docker stop $(docker ps -f name=oral_$1 -q)
    docker-compose --project-name=$BUILD_ID-oral start $1
    ;;
    "member")
    docker-compose --project-name=$BUILD_ID-oral up --no-color --no-start --build $1
    docker stop $(docker ps -f name=oral_$1 -q)
    docker-compose --project-name=$BUILD_ID-oral start $1
    ;;
    "resource")
    docker-compose --project-name=$BUILD_ID-oral up --no-color --no-start --build $1
    docker stop $(docker ps -f name=oral_$1 -q)
    docker-compose --project-name=$BUILD_ID-oral start $1
    ;;
    *) echo please provide a service name ;;
esac
