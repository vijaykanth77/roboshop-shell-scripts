LOG_FILE=/tmp/mongodb
echo 'setting Mongo DB db repo'
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>$LOG_FILE
echo status = $?

echo 'Installing Mongo DB server'
yum install -y mongodb-org &>>$LOG_FILE
echo status = $?

echo 'Starting Mongo DB Service'
systemctl enable mongod &>>$LOG_FILE
systemctl start mongod &>>$LOG_FILE
echo status = $?




