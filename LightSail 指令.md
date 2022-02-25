# LightSail 指令

## Apache
### 新增監聽port
`vim /opt/bitnami/apache2/conf/httpd.conf`
```
Listen 50080
```
### 新增Virtual Host
`vim /opt/bitnami/apache2/conf/vhosts/[site_name].conf`
```
<VirtualHost *:50080 _default_:50080>
	# ServerName _
	DocumentRoot /home/bitnami/htdocs/koel/public
	<Directory "/home/bitnami/htdocs/koel/public">
		Options -Indexes +FollowSymLinks -MultiViews
		AllowOverride All
		Require all granted
	</Directory>
</VirtualHost>
```
### 重啟Apache
`sudo /opt/bitnami/ctlscript.sh restart apache`