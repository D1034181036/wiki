# Raspberry Pi + Ubuntu Server

## 安裝 Ubuntu Server 20.04
[Raspberry Pi Imager](https://www.raspberrypi.com/software/)

## 第一次登入
1. 使用網路線連接區域網路(DHCP)
1. SSH連入樹莓派
1. 帳號: `ubuntu` 密碼: `ubuntu`

## 設定無線網路

`sudo vi /etc/netplan/wireless.yaml`
```
network:
  version: 2
  wifis:
    wlan0:
      dhcp4: yes
      dhcp6: no
      access-points:
        "[WIFI-SSID]":
          password: "[WIFI-PASSWORD]"
```
`sudo netplan apply`