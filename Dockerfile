FROM nginx
RUN apt-get update && \
 apt-get -y install iputils-ping && \
 apt-get -y install net-tools && \
 apt-get -y install curl wget && \
 apt-get -y install traceroute netcat dnsutils

COPY wrapper.sh /

COPY html /usr/share/nginx/html

CMD ["./wrapper.sh"]
