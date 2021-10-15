pipeline {
    agent { label 'master' }
    stages {
        stage('Prepare') {
            steps {
                script {
                    if (env.CLEAR_WORKSPACE.toBoolean()) {
                        deleteDir()
                    }
                    if (env.UPDATE_DOCKER.toBoolean() || env.CLEAR_WORKSPACE.toBoolean()) {
                        git credentialsId: '7bda0671-f744-46a8-ad29-7040aaa72b7a', url: 'https://github.com/khoaiscity/oral-test-docker.git'
                    }
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    if (env.BACKEND.toBoolean()) {
                        dir ('backend/mlm-standard-api') {
                            git branch: 'oral-test', credentialsId: '7bda0671-f744-46a8-ad29-7040aaa72b7a', url: 'https://github.com/smartblock/mlm-standard-api.git'
                        }
                        dir ('./') {
                            sh 'docker-compose up --no-color --build backend-build'
                            sh 'cp ./backend/go-space/bin/mlm-standard-api ./release/backend/go-space/bin'
                        }
                    }
                    if (env.ADMIN.toBoolean()) {
                        dir ('admin/admin-source') {
                            git branch: 'oral-test', credentialsId: '7bda0671-f744-46a8-ad29-7040aaa72b7a', url: 'https://github.com/smartblock/mlm-standard-admin.git'
                        }
                        dir ('./') {
                            sh 'docker-compose up --no-color --build admin-build'
                            sh 'cp ./admin/build/admin.tar.gz ./release/admin'
                            sh 'rm ./admin/build/admin.tar.gz'
                        }
                    }
                    if (env.MEMBER.toBoolean()) {
                        dir ('member/member-source') {
                            git branch: 'oral-test', credentialsId: '7bda0671-f744-46a8-ad29-7040aaa72b7a', url: 'https://github.com/smartblock/mlm-standard-member.git'
                        }
                        dir ('./') {
                            sh 'docker-compose up --no-color --build member-build'
                            sh 'cp ./member/build/member.tar.gz ./release/member'
                            sh 'rm ./member/build/member.tar.gz'
                        }
                    }
                    if (env.RESOURCE.toBoolean()) {
                        dir ('resource/member-source') {
                            git branch: 'oral-test', credentialsId: '7bda0671-f744-46a8-ad29-7040aaa72b7a', url: 'https://github.com/smartblock/mlm-standard-member.git'
                        }
                        dir ('./') {
                            sh 'docker-compose up --no-color --build resource-build'
                            sh 'cp ./resource/build/resource.tar.gz ./release/resource'
                        }
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    dir ('release') {
                        if (env.BACKEND.toBoolean()) {
                            sh 'sh run.sh backend'
                        }
                        if (env.ADMIN.toBoolean()) {
                            sh 'sh run.sh admin'
                        }
                        if (env.MEMBER.toBoolean()) {
                            sh 'sh run.sh member'
                        }
                        if (env.RESOURCE.toBoolean()) {
                            sh 'sh run.sh resource'
                        }
                    }
                }
            }
        }
        stage('Test') {
            steps {
                echo 'Test'
            }
        }
    }
}