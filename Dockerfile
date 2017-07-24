FROM qnib/alplain-init

RUN apk add --no-cache nginx nginx-mod-http-lua lua-cjson \
 && mkdir -p /run/nginx \
 && rm -f /etc/nginx/conf.d/default.conf \
    /etc/nginx/nginx.conf
ADD etc/nginx/nginx.conf /etc/nginx/
CMD ["/usr/sbin/nginx"]
