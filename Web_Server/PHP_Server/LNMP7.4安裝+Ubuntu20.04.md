# LNMP7.4 w/ Ubuntu20.04

## 前置作業 - 設定初始環境
```
# update server packages
apt update -y && apt upgrade -y

# update server timezone
timedatectl set-timezone Asia/Taipei

# update locale
locale-gen en_US.UTF-8
update-locale LANG=en_US.UTF-8

# install required packages
apt install curl wget vim git zip unzip -y
```

## 安裝nginx
```
apt install nginx -y
```

## 安裝php7.4
```
apt install php7.4 php7.4-fpm php7.4-cli php7.4-mysql php7.4-curl php7.4-json php7.4-xml php7.4-mbstring php7.4-zip -y

# 刪除與apache相關的服務。(不需要用到apache的話)
apt purge apache2 -y && apt autoremove -y && apt autoclean -y
```

## 安裝mysql
```
apt install mysql-server -y
```
## 設定mysql密碼
```
mysql
# mysql -p -u root
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'abc123';
```

## 設定nginx連結php7.4-fpm
```
vim /etc/nginx/sites-available/default
```
```
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.php index.html index.htm;
    server_name _;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.4-fpm.sock;
    }
}

```
## 重啟服務
```
service nginx restart
service php7.4-fpm restart
service mysql restart
```

## 安裝composer 
```
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

mv composer.phar /usr/local/bin/composer
```

## 安裝phpmyadmin
```
apt install phpmyadmin -y
ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin
```

## reference

> [How to install PHP 7.4 With Nginx on Ubuntu 20.04.](https://www.rosehosting.com/blog/how-to-install-php-7-4-with-nginx-on-ubuntu-20-04/)

> [You are seeing this message because you have apache2 package installed.](https://blog.csdn.net/zhezhebie/article/details/79940324)

> [Command-line installation](https://getcomposer.org/download/)

## 筆記
> date: 2021/09/07