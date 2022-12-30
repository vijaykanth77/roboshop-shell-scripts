echo installing nginx
yum install nginx -y
systemctl enable nginx

echo downloading ngimx
crl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"

cd /usr/share/nginx/html

echo removing web content
rm -rf *


unzip /tmp/frontend.zip
mv frontend-main/static/* .
mv frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf

eecho starting nginx service
systemctl restart nginx
