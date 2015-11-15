#!/bin/sh



# nginx
yum update -y
rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
yum install -y nginx

# site
WEB_HOME=/var/www
WEB_USER=root
NGINX_SITE_CONF=/etc/nginx/conf.d

dir="$(cd "$(dirname "$0")"; pwd)"

# parameter: user domain config
create_site() {
    echo -e "** Creating Website $2:"
    echo -e "\tWeb Home: $WEB_HOME"
    echo -e "\tNginx Conf: $NGINX_SITE_CONF"

    mkdir $WEB_HOME
    mkdir $WEB_HOME/$2
    mkdir $WEB_HOME/$2/public_html
    mkdir $WEB_HOME/$2/ssl
    mkdir $WEB_HOME/$2/logs

    echo -e "Hello World!\n$2" > $WEB_HOME/$2/public_html/index.html

    chmod --silent 400 $WEB_HOME/$2/ssl/*
    chmod --silent 644 $WEB_HOME/$2/ssl
    chown -R $1:$1 $WEB_HOME/$2

    cp $dir/$3 $NGINX_SITE_CONF/$2.conf
    ESCAPED_SITE_HOME=$(echo "$WEB_HOME/$2" | sed 's/\//\\\//g' -)
    sed -i -e "s/DOMAIN/$2/g" -e "s/SITE_HOME/$ESCAPED_SITE_HOME/g" $NGINX_SITE_CONF/$2.conf
}

create_site your-user your-domain your-domain.conf

# start
systemctl stop nginx.service
systemctl enable nginx.service
systemctl start nginx.service
