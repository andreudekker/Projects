<?php
# FileName="Connection_php_mysql.htm"
# Type="MYSQL"
# HTTP="true"
$hostname_userconect = "localhost";
$database_userconect = "controlbuzz";
$username_userconect = "root";
$password_userconect = "";
$userconect = mysql_pconnect($hostname_userconect, $username_userconect, $password_userconect) or trigger_error(mysql_error(),E_USER_ERROR); 
?>