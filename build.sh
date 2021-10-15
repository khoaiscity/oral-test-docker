#!/bin/bash
export COMPOSE_HTTP_TIMEOUT=3000

case $1 in
    "backend")
    docker-compose up --no-color --build $1-build
    cp ./backend/go-space/bin/mlm-standard-api ./release/backend/go-space/bin
    ;;
    "admin")
    docker-compose up --no-color --build $1-build
    cp ./admin/build/admin.tar.gz ./release/admin
    sudo rm -rf ./admin/admin-source/client/node_modules
    sudo rm ./admin/build/admin.tar.gz
    ;;
    "member")
    docker-compose up --no-color --build $1-build
    cp ./member/build/member.tar.gz ./release/member
    sudo rm -rf ./member/member-source/client/node_modules
    sudo rm ./member/build/member.tar.gz
    ;;
    "resource")
    docker-compose up --no-color --build $1-build
    cp ./resource/build/resource.tar.gz ./release/resource
    ;;
    *) echo please provide a service name ;;
esac
