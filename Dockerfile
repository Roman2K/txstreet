FROM node:16-alpine

COPY . /home/node/app

WORKDIR /home/node/app

RUN test -f yarn.lock
RUN apk --update --no-cache --virtual .build-deps add yarn git \
  && yarn install \
  && apk del .build-deps

RUN chown -R node:node /home/node/app

USER node

CMD ["yarn", "run", "build", "--no-clean"]
