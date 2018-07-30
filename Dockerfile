FROM alpine:latest
MAINTAINER skyscraperV 947742853@qq.com

# install nginx runit curl
RUN apk --update --no-cache add nginx curl runit

ADD consul-template_0.19.0_linux_amd64.tgz /usr/local/bin/

RUN mkdir -p /tmp/dir/
ADD . /tmp/dir/
WORKDIR /tmp/dir/

ADD nginx.service /etc/service/nginx/run
RUN chmod a+x /etc/service/nginx/run
ADD consul-template.service /etc/service/consul-template/run
RUN chmod a+x /etc/service/consul-template/run

RUN rm -v /etc/nginx/conf.d/*
RUN mkdir -p /run/nginx/ && mkdir -p /etc/consul-templates/

RUN cp /tmp/dir/nginx.conf.ctmpl /etc/consul-templates/

CMD sh -c 'sh /tmp/dir/replace_env.sh && cp /tmp/dir/nginx.conf.ctmpl /etc/consul-templates/ && runsvdir /etc/service'
