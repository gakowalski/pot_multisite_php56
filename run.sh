#sudo docker run -v /var/www/html/portal:/var/www/html/portal -p 127.0.0.1:9001:80/tcp --privileged=true --network host -d -it joomla_multisite:latest
sudo docker run -v /var/www/html/portal:/var/www/html/portal -v /var/lib/mysql/mysql.sock:/var/lib/mysql/mysql.sock -p 127.0.0.1:9001:80/tcp --privileged=true --network host -d -it joomla_multisite:latest
