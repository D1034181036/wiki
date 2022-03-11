# Nginx反向代理

### 新增Virtual Host (範例)
`vim /etc/nginx/sites-enabled/subsonic`

```
server{
    listen 80;
    charset utf-8;
    server_name music.ltd2.cc;

    location / {
        proxy_pass http://192.168.0.23:4040;
        proxy_redirect default;
    }
}
```

### 重啟Nginx
`nginx -t`
`service nginx restart`