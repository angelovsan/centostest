NameVirtualHost *:80

<VirtualHost *:80>

        ServerName proxy1.com
        ErrorLog logs/proxy1_errors
        CustomLog logs/proxy1_access_log combined

        DocumentRoot /var/www/html/

        #<Proxy balancer://mycluster>
        #BalancerMember http://localhost:8075
        #BalancerMember http://localhost:8076
        #</Proxy>

        #ProxyPass / balancer://mycluster/

        <Proxy balancer://mycluster2 stickysession=JSESSIONID>
        BalancerMember ajp://localhost:8075 route=tomcat01
        BalancerMember ajp://localhost:8076 route=tomcat02
        </Proxy>

        ProxyPass / balancer://mycluster2/
</VirtualHost>
