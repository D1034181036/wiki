FROM ubuntu:20.04
MAINTAINER Kevin

# 設定timezone變數
ENV TZ=Asia/Taipei

# ====================

# 建立Dockerfile期間使用非交互式安裝
ARG DEBIAN_FRONTEND=noninteractive

# 更新apt
RUN apt update -y && apt upgrade -y

# 設定locale
RUN apt install locales -y && \
    locale-gen --purge en_US.UTF-8

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

# 設定timezone
# setup timezone to $TZ
RUN apt install -y tzdata && \
    rm -rf /etc/localtime && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

# 安裝環境所需套件
RUN apt install curl wget vim git zip unzip -y

# ====================

# 安裝Nginx
RUN apt install nginx -y

# 安裝php7.4
RUN apt install php7.4 php7.4-fpm php7.4-cli php7.4-mysql php7.4-curl php7.4-json php7.4-xml php7.4-mbstring php7.4-zip -y

# 移除apache2
RUN apt purge apache2 -y && apt autoremove -y && apt autoclean -y

# 安裝mysql
RUN apt install mysql-server -y

# 設定Nginx - site-available (已預設ln連結至site-enable)
RUN mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak
COPY config/default /etc/nginx/sites-available/default

# 安裝composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

# 安裝phpmyadmin
RUN apt install phpmyadmin -y
RUN ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

# ====================

# 設定開機script檔案
COPY start.sh /root/start.sh
RUN chmod -R 755 /root/start.sh
ENTRYPOINT ["/root/start.sh"]
