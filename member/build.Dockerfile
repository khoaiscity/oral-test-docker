FROM node:10-alpine

ENV APP_HOME /app
ENV NG_CLI_ANALYTICS off

RUN mkdir $APP_HOME

WORKDIR $APP_HOME

COPY ./config.ts $APP_HOME/

CMD echo BUILDING... \
  && cp config.ts member-source/client/src/app/ \
  && npm install --no-color --silent --prefix member-source/client \
  && npm run build --progress=false --no-color --prefix member-source/client \
  && cd member-source \
  && echo COMPRESSING... \
  && tar -czf $APP_HOME/build/member.tar.gz server \
  && echo DONE!!!
