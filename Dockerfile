FROM ubuntu:23
WORKDIR /
RUN sed -i "s/^# deb-src/deb-src/g" /etc/apt/sources.list
RUN apt update && apt install -y libmaxminddb-dev mmdb-bin libmaxminddb0
ADD https://nginx.org/download/nginx-1.25.2.tar.gz /nginx.tar.gz
RUN tar -zxvf /nginx.tar.gz
RUN cd /nginx-1.25.2
RUN apt build-dep -y nginx

WORKDIR /nginx-1.25.2
COPY ./ngx_http_geoip2_module /ngx_http_geoip2_module
RUN ./configure --add-dynamic-module=/ngx_http_geoip2_module
RUN make
RUN make install

ENTRYPOINT ["/usr/local/nginx/sbin/nginx"]