# FROM ubuntu:latest
FROM phpdockerio/php:8.1-fpm

RUN apt-get update -y 
RUN apt-get install -y cron

ADD hello.cronjob /opt/hello/hello.cronjob

RUN \
	chmod 0644 /opt/hello/hello.cronjob && \
	crontab /opt/hello/hello.cronjob

RUN \
	touch /var/log/cron.log

CMD (cron -f &) 
