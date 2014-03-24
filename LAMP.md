# Install LAMP

1. __Prerequisite__

    install gcc, gcc-c++
    
    ```
    sudo yum install gcc gcc-c++
    sudo yum install libxml2-devel
    ```

2. __Install nginx__
    1. Download nginx source
    
        [http://nginx.org/download/nginx-1.4.2.tar.gz](http://nginx.org/download/nginx-1.4.2.tar.gz)

    2. Download pcre if haven’t been installed

        [ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.33.tar.gz](ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.33.tar.gz)

    3. Download zlib if not installed:

        [http://zlib.net/zlib-1.2.8.tar.gz](http://zlib.net/zlib-1.2.8.tar.gz)

    4. Extract nginx

    5. Run:
    
        ```
        ./configure --prefix=/home/vnmylife/programs/nginx --with-pcre=~/package/pcre-8.33 --with-zlib=~/package/zlib-1.2.8 --with-openssl=/usr/lib/openssl
        ```
    
    6. Run Nginx: `nginx_install_dir/sbin/nginx`

3. __Install php__

    1. sudo yum install libxslt libxslt-devl	

    2. Download php source code

    3. Run configure(in extracted php source code):

        ```
        ./configure --prefix=/home/vnmylife/programs/php --with-mysql=/usr/local/bin/mysql --with-mysqli=/usr/local/bin/mysql/bin/mysql_config --enable-fpm --with-zlib --with-xsl --enable-fpm --with-pdo-mysql=/usr/local/bin/mysql --with-zip --with-openssl
        ```
        
        *Note: prefix → where php will be installed*

4. __Config PHP: add the following configuration in nginx.conf__
    
        location ~ \.php$ {
            fastcgi_pass   localhost:9000;
            fastcgi_index  index.php;
            fastcgi_param  SCRIPT_FILENAME   $document_root$fastcgi_script_name;
            include        fastcgi_params;
        }

5. __Run PHP-FPM__: `php_install_dir/sbin/php-fpm`

6. __Run mysql__

    1. init db:

        `mysql_install_db --basedir= --datadir=/home/mysql/data`

    2. start `bin/mysqld --defaults-file=/usr/local/bin/mysql/my.cnf < /dev/null > /dev/null 2>/dev/null &`

    3. Config logging in MySql
    
            # Logging   
            # slow query log
            slow_query_log = 1
            slow_query_log_file = /path/to/log/file
            # no index query log  
            log-queries-not-using-indexes = 1
    
7. __Install additional php module__

    1. Install autoconf
            sudo yum install autoconf

    2. find module in php source folder(ext folder)
            phpize
            ./configure --prefix=/path/to/module
        
    3. add the installed module in php.ini

8. __Sample php.ini__
    [http://git.php.net/?p=php-src.git;a=blob_plain;f=php.ini-production;hb=HEAD](http://git.php.net/?p=php-src.git;a=blob_plain;f=php.ini-production;hb=HEAD)

9. __Install composer__
        
        curl -sS https://getcomposer.org/installer | php
    
    add composer to PATH(without .phar)
    
    after that can run: composer install

10. __Config nginx to work with symfony__

    [http://wiki.nginx.org/Symfony](http://wiki.nginx.org/Symfony)