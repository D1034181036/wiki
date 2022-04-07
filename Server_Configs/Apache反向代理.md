# LightSail 指令

## Apache

### 新增Virtual Host (範例)
`vim /opt/bitnami/apache2/conf/vhosts/[site_name].conf`

```
<VirtualHost *:80 _default_:80>
  ServerName cloud.ltd2.cc
  DocumentRoot /home/bitnami/htdocs
  <Directory "/home/bitnami/htdocs">
    Options -Indexes +FollowSymLinks -MultiViews
    AllowOverride All
    Require all granted
  </Directory>
</VirtualHost>
```

```
<VirtualHost *:80>
  ServerName yourdomain.com
  ProxyRequests off
  <Proxy *>
    Order allow,deny
    Allow from all
  </Proxy>

  ProxyPass / http://192.168.1.99
  ProxyPassReverse / http://192.168.1.99
</VirtualHost>
```

### 重啟Apache
`sudo /opt/bitnami/ctlscript.sh restart apache`