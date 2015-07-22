##########################################################
#                  /!\ WARNING /!\                       #
# This is completely experimental. Use at your own risk. #
#             Also, learn you some docker:               #
#           http://docker.io/gettingstarted              #
##########################################################

FROM node:0.10-onbuild
MAINTAINER Olafur Osvaldsson <osvaldsson@icelandic.net>

# Base system setup

RUN useradd --create-home fxa

USER fxa

RUN mkdir -p /home/fxa/auth-db-mysql

ADD . /home/fxa/auth-db-mysql/

WORKDIR /home/fxa/auth-db-mysql

# Run the Auth DB Server

ENTRYPOINT ["npm"]
CMD ["start"]
