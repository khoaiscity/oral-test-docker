FROM node:10-alpine

ENV APP_HOME /app

RUN mkdir $APP_HOME

WORKDIR $APP_HOME

CMD echo BUILDING... \
  && npm install --no-color --silent --prefix member-source/resource-server \
  && cd member-source \
  && echo COMPRESSING... \
  && tar -czf $APP_HOME/build/resource.tar.gz ./resource-server \
  && echo DONE!!!
