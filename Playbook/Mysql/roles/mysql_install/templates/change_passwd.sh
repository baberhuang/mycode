#!/bin/expect
#该脚本用于更改数据库root密码并配置远程访问

expect <<EOF
spawn mysql -uroot -p
expect "password"
send "\n"
expect "mysql>" 
send "flush privileges;\n"
expect "mysql>" 
send "ALTER USER root@localhost IDENTIFIED BY 'Temence414212gbj';\n"
expect "mysql>" 
send "use mysql;\n"
expect "mysql>" 
send "update user set host='%' where user='root' and host='localhost';\n"
expect "mysql>" 
send "flush privileges;\n"
expect eof
EOF
