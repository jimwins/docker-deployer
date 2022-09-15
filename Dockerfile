FROM php:8.1.10-alpine

LABEL maintainer="herloct <herloct@gmail.com>"

ENV DEPLOYER_VERSION=7.0.2

RUN apk update --no-cache \
    && apk add --no-cache \
        openssh-client rsync

RUN curl -L https://github.com/deployphp/deployer/releases/download/v$DEPLOYER_VERSION/deployer.phar > /usr/local/bin/deployer \
    && chmod +x /usr/local/bin/deployer

VOLUME ["/project", "$HOME/.ssh"]
WORKDIR /project

ENTRYPOINT ["deployer"]
CMD ["--version"]
