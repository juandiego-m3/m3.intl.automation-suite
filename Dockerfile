FROM node:8
ARG npm_user
ARG npm_email
ARG npm_pass
ARG npm_registry


ADD . /app/
WORKDIR /app

RUN npm install -g npm-cli-login
RUN npm set registry $npm_registry
RUN npm-cli-login -u $npm_user -p $npm_pass -e $npm_email -r $npm_registry
RUN yarn install