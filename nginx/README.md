sudo cp /var/lib/jenkins/workspace/oral-test-deploy/nginx/sites-available/oral-admin-test.securelayers.cloud /etc/nginx/sites-available/oral-admin-test.securelayers.cloud
sudo cp /var/lib/jenkins/workspace/oral-test-deploy/nginx/sites-available/oral-mem-test.securelayers.cloud /etc/nginx/sites-available/oral-mem-test.securelayers.cloud

sudo ln -s /etc/nginx/sites-available/oral-admin-test.securelayers.cloud /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/oral-mem-test.securelayers.cloud /etc/nginx/sites-enabled/

sudo tail -f /var/log/nginx/err-standard-api.log
sudo tail -f /var/log/nginx/acc-standard-api.log

sudo tail -f /var/log/nginx/access.log

sudo service nginx restart
sudo service nginx status
