FROM node:10-alpine

ENV APP_HOME /app

RUN mkdir $APP_HOME

WORKDIR $APP_HOME

CMD echo BUILDING... \
  && npm install
  && tar -czf $APP_HOME/build/resource.tar.gz ./resource-server \
  && echo DONE!!!
