FROM nginx:1.17
LABEL maintainer="LongTH <longth.hust@gmail.com>"
ENV PEPPER_HOST_NAME tunnel.longth.ml
COPY startup.sh /usr/local/bin/startup.sh
RUN set -x \
    && chmod 700 /usr/local/bin/startup.sh \
    && apt-get -y update \
    && apt-get -y install certbot python-certbot-nginx
COPY nginx/conf.d /etc/nginx/conf.d
RUN perl -pe 's/\$\$(\w+))/$ENV{$1}/g' /etc/nginx/conf.d/tunnel.longth.ml.conf > tempfile \
    && mv tempfile /etc/nginx/conf.d/tunnel.longth.ml.conf