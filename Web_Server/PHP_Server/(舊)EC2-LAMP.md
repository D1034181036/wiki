## EC2

1. 選擇作業系統: Ubuntu Server 16.04 LTS (HVM)
2. 選擇主機類型: t2.micro (單核CPU / 1GB)
3. 取得金鑰檔並啟動: 將pem金鑰檔存在本地路徑(官方推薦) "C:\Users\使用者名稱\.ssh\"
4. 設定安全組(Security Groups): 在Inbound中新增Port80(HTTP)與Port443(HTTPS)

## SSH登入

1. 下載PuTTY (https://www.putty.org/)
2. 使用PuTTYgen將pem檔轉成ppk檔: Conversions -> Import key -> Save private key, 一樣放在"C:\Users\使用者名稱\.ssh\"
3. 使用PuTTY登入: Connection -> SSH -> Auth -> 選擇ppk金鑰檔
4. 免key教學(optional): 
    1. `sudo su`
    1. `passwd root `
    1. `vi /etc/ssh/sshd_config`
    1. 修改 `PermitRootLogin yes`
    1. 修改 `PasswordAuthentication yes`
    1. `vi /root/.ssh/authorized_keys`
    1. 刪除 `command="echo 'Please login as the ec2-user user rather than root user.';echo;sleep 10"`
    1. 重啟 `service sshd restart`

## 安裝LAMP with Tasksel

1.更新系統: sudo apt update && sudo apt upgrade && sudo apt dist-upgrade
2.安裝Tasksel: sudo apt install tasksel
3.安裝LAMP: sudo tasksel -> 選擇LAMP -> 設定MySQL密碼
4.安裝phpMyAdmin: sudo apt install phpmyadmin

## 使用FileZilla管理檔案

1.下載FileZilla
2.新增站台: 選擇SFTP, 使用金鑰檔或帳密登入
3.網站首頁位置: /var/www/html/

## 設定php的上傳限制

`vi /etc/php/7.0/apache2/php.ini`

修改以下數值(自行調整)
```
upload_max_filesize = 128M
post_max_size = 128M
memory_limit = 128M
max_execution_time = 6000
max_input_time = 6000
```
重啟指令: `sudo service apache2 restart`

## python3
1. 安裝python3.7 `apt install python3.7`
1. 安裝pip3: `apt install python3-pip`
1. 使用pip3安裝套件: `pip3 install -U {package_name}`