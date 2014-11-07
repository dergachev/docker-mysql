FROM ubuntu:latest
MAINTAINER alex@evolvingweb.ca

ADD detect_squid_deb_proxy /tmp/detect_squid_deb_proxy
RUN bash /tmp/detect_squid_deb_proxy && apt-get update

RUN apt-get install -y mysql-server \
 && rm -rf /var/lib/mysql/mysql \
 && rm -rf /var/lib/apt/lists/* # 20140918

ADD start /start
RUN chmod 755 /start

EXPOSE 3306

VOLUME ["/var/lib/mysql"]
VOLUME ["/run/mysqld"]

CMD ["/start"]
