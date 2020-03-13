# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbensarg <sbensarg@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/15 20:30:09 by sbensarg          #+#    #+#              #
#    Updated: 2020/01/23 13:07:37 by sbensarg         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash


apt-get update
apt-get upgrade

#install wget and unzip to use later
apt-get install unzip -y
apt-get install wget -y

#install golang and libnss3-tools to use in mkcert which will be downloaded using git
apt-get install golang -y
apt install libnss3-tools -y
apt-get install git -y

#installing php with his packages
apt install php7.3-fpm php7.3-cli php7.3-common php7.3-curl php7.3-gd php7.3-mbstring php7.3-mysql php7.3-xml php7.3-xmlrpc php7.3-zip -y


# installation and configuration mysql server
apt-get update -q
apt-get install gnupg -y
apt-get install lsb-release -y
export DEBIAN_FRONTEND=noninteractive
wget https://dev.mysql.com/get/mysql-apt-config_0.8.14-1_all.deb
echo "mysql-apt-config mysql-apt-config/select-server select mysql-5.7" | /usr/bin/debconf-set-selections
dpkg -i mysql-apt-config_0.8.14-1_all.deb
apt-get update -q
apt install -q -y mysql-server
chown -R mysql: /var/lib/mysql
# apt-get install default-mysql-server -y ----> For Maria db

#installing and configuring nginx
apt-get install nginx -y
mv /srcs/default /etc/nginx/sites-available

#installing and configuring phpmyadmin 
cd /var/www/html/
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-english.zip
unzip phpMyAdmin-4.9.0.1-english.zip
mv phpMyAdmin-4.9.0.1-english/ phpmyadmin
rm phpMyAdmin-4.9.0.1-english.zip
mkdir phpmyadmin/tmp
chmod 777 phpmyadmin/tmp
mv /srcs/start.sh /root
/bin/bash /root/start.sh
mysql -u root < phpmyadmin/sql/create_tables.sql

#installing and configuring wordpress
mkdir tmp
chmod 777 tmp
mv /srcs/database.sql .
mysql -u root < database.sql
rm database.sql
mv /srcs/config.inc.php phpmyadmin
mv /srcs/wordpress-5.3.2.zip tmp
cd tmp
unzip wordpress-5.3.2.zip
cd wordpress
mv * ../../
cd ../
rm -rf wordpress*
mv /srcs/wp-config.php /var/www/html

#generatting ssl certinficats .pem using mkcert
cd /root
git clone https://github.com/FiloSottile/mkcert && cd mkcert
go build -ldflags "-X main.Version=$(git describe --tags)"
./mkcert -install
./mkcert localhost
mkdir /etc/nginx/ssl
mv localhost.pem /etc/nginx/ssl
mv localhost-key.pem /etc/nginx/ssl
