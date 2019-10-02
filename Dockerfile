FROM centos:7

ENV container docker

RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum -y install install https://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum -y install yum-utils
RUN yum-config-manager --enable remi-php56
RUN yum -y update
RUN yum -y install php php-opcache php-cli php-common php-gd php-intl php-mbstring php-mcrypt php-mysql php-pdo php-pear php-soap php-xml php-xmlrpc httpd
RUN php --version && php --modules

# tools
RUN yum -y install iproute at curl crontabs git

# we want some config changes
COPY config/php_settings.ini /etc/php.d/
COPY config/v-host.conf /etc/httpd/conf.d/

# create webserver-default directory
RUN mkdir -p /var/www/html/portal
VOLUME ["/var/www/html/portal", "/var/log/httpd"]

EXPOSE 80

RUN systemctl enable httpd \
 && systemctl enable crond

CMD ["/usr/sbin/init"]
