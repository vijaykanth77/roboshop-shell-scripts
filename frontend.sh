echo installing nginx
yum install nginx -y &>>/tmp/frontend
systemctl enable nginx &>>/tmp/frontend

echo downloading ngimx
crl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>/tmp/frontend

cd /usr/share/nginx/html &>>/tmp/frontend

echo removing web content
rm -rf * &>>/tmp/frontend


unzip /tmp/frontend.zip &>>/tmp/frontend
mv frontend-main/static/* . &>>/tmp/frontend
mv frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf &>>/tmp/frontend

eecho starting nginx service
systemctl restart nginx &>>/tmp/frontend
