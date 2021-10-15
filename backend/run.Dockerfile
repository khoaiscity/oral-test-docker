FROM golang:1.15.0-alpine

ENV APP_HOME /app

WORKDIR $APP_HOME

ENV GOPATH /app/go-space

RUN apk add --no-cache \
  libc6-compat

COPY ./go-space /app/go-space

CMD cd /app/go-space \
  && ls && ls bin \
  && bin/mlm-standard-api
