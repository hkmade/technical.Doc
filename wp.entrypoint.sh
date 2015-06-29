
#!/bin/sh

# wp를 위한 DB생성
# apache foreground로 반드시 실행할 것
mysql -h db -uroot -p$DB_ENV_MYSQL_ROOT_PASSWORD -e "create database wp"
apachectl -DFOREGROUND
