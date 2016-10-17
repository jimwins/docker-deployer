FROM php:7.0.12-alpine

MAINTAINER herloct <herloct@gmail.com>

RUN curl -L http://deployer.org/deployer.phar > /usr/local/bin/deployer \
    && chmod +x /usr/local/bin/deployer

RUN mkdir -p /project $HOME/.ssh
VOLUME ["/project", "$HOME/.ssh"]
WORKDIR /project

ENTRYPOINT ["deployer"]
CMD ["--version"]