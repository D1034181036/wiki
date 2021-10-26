#!/bin/bash

service nginx restart
service php7.4-fpm restart
service mysql restart

while true; do sleep 1d; done