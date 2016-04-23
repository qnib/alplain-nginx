FROM qnib/alplain-init

ONBUILD RUN echo "#Please provide your own config!" \
 && rm -f /etc/nginx/conf.d/default.conf \
          /etc/nginx/default.d/root.conf
RUN apk add --update nginx \
 && rm -rf /var/cache/apk/*
ADD etc/nginx/nginx.conf /etc/nginx/
ADD etc/nginx/conf.d/default.conf /etc/nginx/conf.d/
ADD etc/nginx/default.d/root.conf /etc/nginx/default.d/
ADD opt/qnib/nginx/bin/start.sh /opt/qnib/nginx/bin/
ADD opt/qnib/nginx/consul.d/nginx.json /opt/qnib/nginx/consul.d/
CMD ["/opt/qnib/nginx/bin/start.sh"]
