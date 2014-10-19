FROM debian:jessie

RUN apt-get -q update
RUN apt-get -qy install squid3
# Copy a configuration file from the current directory
ADD squid.conf /etc/squid3/
ADD squid_passwd /etc/squid3/

CMD [ "squid3", "-N"]