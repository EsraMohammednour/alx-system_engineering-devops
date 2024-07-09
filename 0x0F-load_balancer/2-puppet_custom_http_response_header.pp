#!/usr/bin/env bash
#Configration using puppet
exec { 'http header':
	command  => "sudo apt-get update;
	sudo apt-get -y install nginx;
	touch /var/www/html/index.html;
	sed -i "server_name _;\n\trewrite ^/reddirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanet;" /etc/nginx/sites_available/default;
	sed -i "server_name _;\n\terror_page 404 /404.html ;" /etc/nginx/sites_available/default;
	touch /var/www/html/404.html;
	echo "Ceci n'est pas une page" > /etc/nginx/html/404.html;
	sudo sed -i "/server_name _/a add_header X-Served-By $HOSTNAME;" /etc/nginx/sites_available/default
	sudo service nginx restart',
	provider => shell,
}
