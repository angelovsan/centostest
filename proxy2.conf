LoadModule jk_module modules/mod_jk.so
JkWorkersFile /etc/httpd/conf.d/workers.properties
JkLogFile /var/log/httpd/mod_jk.log
JkLogLevel info
JkLogStampFormat "[%a %b %d %H:%M:%S %Y] "

<VirtualHost *:80>

        ServerName proxy2.com
        ErrorLog logs/proxy2_errors
        CustomLog logs/proxy2_access_log combined

        DocumentRoot /var/www/html/

        JkMount /* loadbalancer
        JkMount /status/* status

</VirtualHost>
