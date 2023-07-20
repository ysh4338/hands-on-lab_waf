echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!!!!!!!!!!!! 반드시 su 로 관리자 진입을 해야 합니다. !!!!!!!!!!!!"
echo "!!!!!  su 모드가 아니라면 Ctrl + c 로 취소 후 진행 해주세요 !!!!!"
echo "!!!!    =========       5초뒤 실행됩니다.      =========     !!!!"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
for var in 1 2 3 4 5
do
        echo $var...
        sleep 1
done

echo "Install Package and Settings"
apt update -y
apt upgrade -y
apt install -y git
apt install -y apache2
apt install -y mysql-server mysql-client
apt install -y php php-mysqli php-gd libapache2-mod-php

cd ~
git clone --recursive https://github.com/ethicalhack3r/DVWA.git
rm /var/www/html/index.html

cp -r ~/DVWA/* /var/www/html
cd /var/www/html
cp config/config.inc.php.dist config/config.inc.php

chmod -R 777 /var/www/

sed -i 's/allow_url_include = off/allow_url_include = on/' /var/www/html/php.ini
sed -i 's/allow_url_fopen = off/allow_url_fopen = on/' /var/www/html/php.ini

sed -i 's/allow_url_include = Off/allow_url_include = On/' /etc/php/7.2/cli/php.ini
sed -i 's/allow_url_fopen = Off/allow_url_fopen = On/' /etc/php/7.2/cli/php.ini

sed -i 's/allow_url_include = Off/allow_url_include = On/' /etc/php/7.2/apache2/php.ini
sed -i 's/allow_url_fopen = Off/allow_url_fopen = On/' /etc/php/7.2/apache2/php.ini

chmod 777 /var/www/html/hackable/uploads/
chmod 777 /var/www/html/external/phpids/0.6/lib/IDS/tmp/phpids_log.txt
chmod 777 /var/www/html/config

echo "Building Database..."
sleep 1

mysql -e "create database dvwa;"
mysql -e "create user dvwa@localhost identified by 'p@ssw0rd';"
mysql -e "grant all on dvwa.* to dvwa@localhost;"
mysql -e "flush privileges;"
mysql -e "show databases;"

echo "DB Created!!"
echo "Please Login And Checking"
echo "mysql -u dvwa -pp@ssword"

echo "Restarting Apache2 Service...."
service apache2 restart
sleep 1

apt update -y

echo DONE!!
echo ID : dvwa
echo PW : p@ssw0rd

echo "Please Edit reCAPCHA key Value"
echo "File Path : /var/www/html/config/config.inc.php"
echo "URL : https://www.google.com/recaptcha/admin"
