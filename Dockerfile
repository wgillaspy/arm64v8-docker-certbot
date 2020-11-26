FROM arm64v8/alpine:latest

RUN apk add --update openjdk8 git openssh openssh-client bash curl certbot python

