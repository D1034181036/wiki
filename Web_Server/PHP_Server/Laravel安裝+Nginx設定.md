# Laravel安裝 & Nginx設定

## 安裝composer 
```
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

mv composer.phar /usr/local/bin/composer
```

## 下載指定版本laravel (如laravel 6.*)
```
composer create-project --prefer-dist laravel/laravel laravel6-test "6.*"
```

#### if permission denied
```
chown -R $USER:www-data storage
chown -R $USER:www-data bootstrap/cache
chmod -R 775 storage
chmod -R 775 bootstrap/cache
```

## Nginx設定vhost至public資料夾
```
vim /etc/nginx/sites-available/laravel6-test
```
```
server {
        listen 80;
        server_name 35.74.208.28;
        root /var/www/html/laravel6-test/public;
        index index.html index.htm index.php;

    location / {
        try_files $uri $uri/ /index.php$is_args$args;
        autoindex on;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.4-fpm.sock;
    }

    charset utf-8;
    
}
```
```
ln -s /etc/nginx/sites-available/laravel6-test  /etc/nginx/sites-enabled/
nginx -t
service nginx restart
```

## reference
> [Command-line installation](https://getcomposer.org/download/)

## 筆記
> date: 2021/09/07