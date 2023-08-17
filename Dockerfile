#FROM nginx

#RUN apt update && apt install -y libmaxminddb-dev mmdb-bin libnginx-mod-http-geoip2
#RUN apt update && apt install -y libmaxminddb-dev mmdb-bin
#USER www-data
#COPY ./GeoLite2-Country.mmdb /
#COPY ./nginx.conf /etc/nginx/nginx.conf
#COPY --chown=www-data:www-data ./var/www/html /var/www/html

#ENTRYPOINT ["nginx"]

FROM nginx:1.23.4
WORKDIR /var/www/html
RUN apt update && apt install -y libmaxminddb-dev mmdb-bin
#COPY --from=builder --chown=www-data /app/dist .
#COPY --from=builder /app/docker/nginx/nginx.conf /etc/nginx/nginx.conf
#COPY --from=builder /app/docker/entrypoint.sh /docker-entrypoint.d/
