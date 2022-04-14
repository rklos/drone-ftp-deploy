FROM node:16.14.2-alpine

ADD . /ftp-deploy
RUN chmod +x /ftp-deploy/deploy
RUN npm install --prefix /ftp-deploy

ENTRYPOINT /ftp-deploy/deploy
