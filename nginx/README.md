sudo cp /var/lib/jenkins/workspace/oral-deploy/nginx/sites-available/oral-member.securelayers.cloud /etc/nginx/sites-available/oral-member.securelayers.cloud
sudo cp /var/lib/jenkins/workspace/oral-deploy/nginx/sites-available/oral-admin.securelayers.cloud /etc/nginx/sites-available/oral-admin.securelayers.cloud

sudo ln -s /etc/nginx/sites-available/oral-member.securelayers.cloud /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/oral-admin.securelayers.cloud /etc/nginx/sites-enabled/

sudo tail -f /var/log/nginx/err-standard-api.log
sudo tail -f /var/log/nginx/acc-standard-api.log

sudo tail -f /var/log/nginx/access.log

sudo service nginx restart
