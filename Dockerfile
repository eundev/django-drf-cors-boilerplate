FROM ubuntu:18.04

LABEL maintainer="cs.eunlee@gmail.com"

EXPOSE 8000
RUN apt-get clean
RUN apt update -y && apt upgrade -y
RUN apt install -y python3.6 python3-pip virtualenv

RUN mkdir /app

COPY . /app
WORKDIR /app

RUN pip3 install -r requirements.txt
RUN pip3 install -r requirements-dev.txt

CMD gunicorn -b 0.0.0.0:8000 -w 4 main_api.wsgi:application 