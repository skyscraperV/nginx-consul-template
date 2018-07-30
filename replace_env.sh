#!/bin/bash

cp nginx.conf.ctmpl.default nginx.conf.ctmpl

if [ $TAILORED_MONITOR_CONSUL_SERVICE_NAME ];then
	sed -i  "s/TAILORED_MONITOR_CONSUL_SERVICE_NAME_PLACEHOLDER/$TAILORED_MONITOR_CONSUL_SERVICE_NAME/g"  nginx.conf.ctmpl
else
	sed -i  's/TAILORED_MONITOR_CONSUL_SERVICE_NAME_PLACEHOLDER/default_service/g'  nginx.conf.ctmpl
	echo "Default monitor consul service name: default_service ; You'd better use TAILORED_MONITOR_CONSUL_SERVICE_NAME "
fi

if [ $TAILORED_NGINX_LISTEN_PORT ];then
	sed -i  "s/TAILORED_NGINX_LISTEN_PORT_PLACEHOLDER/$TAILORED_NGINX_LISTEN_PORT/g" nginx.conf.ctmpl
else 
	sed -i  's/TAILORED_NGINX_LISTEN_PORT_PLACEHOLDER/80/g' nginx.conf.ctmpl
	echo "Default nginx listen 80 port ; You'd better use TAILORED_NGINX_LISTEN_PORT"
fi 
