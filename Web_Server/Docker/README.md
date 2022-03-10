# Docker基本指令

## 使用Image建立Container

### 格式範例1
```
docker run --name [custom_container_name] \
    -p [server_port]:[container_port] \
    -v /home/ubuntu/html:/var/www/html \
    [image_name] \
    /bin/sh
```

### 格式範例2
```
docker run -id \
    --name html \
    -p 80:80 \
    -p 3306:3306 \
    -v /home/ubuntu/html:/var/www/html \
    lnmp74/1.0 \
    /bin/sh
```


# Image
```
# 顯示現有images
docker images

# 刪除image
docker rmi [image]
```
# Container
```
# 顯示現有container
docker ps
docker ps -a

# 進入container bash
docker exec -it [container_id] bash

# 退出container bash
ctrl+p
ctrl+q

# 開啟、停止container
docker stop [container_id]
docker start [container_id]

# 刪除單一container
docker rm [container_id]

## 刪除所有非執行中的container
docker container prune
```

# Dockerfile
```
## build image
docker build -t [image_name] . --no-cache
```
