FROM node:7.10 as build-deps
WORKDIR /usr/src/app
COPY package.json package-lock.lock ./
RUN npm install
COPY . ./

EXPOSE 80

RUN npm run build
RUN serve -s build
