#/bin/bash

docker network create httpd-nginx-datacontainer

docker create --name datacontainer -v /data:/var/www/html -v /data:/usr/share/nginx/html busybox

docker run -itd -p 8081:80 --network httpd-nginx-datacontainer --volumes-from datacontainer --name nginx  nginx

docker run -itd -p 8082:80 --network httpd-nginx-datacontainer --volumes-from datacontainer --name apache2  samuelk1094/centos-httpd

