# 動作確認

    $ docker-compose up -d
    $ docker exec -it mariadb bash

    root@9d9be88a96d6:/# mysql -u root -ptest
    Welcome to the MariaDB monitor.  Commands end with ; or \g.
    Your MariaDB connection id is 8
    Server version: 10.4.7-MariaDB-1:10.4.7+maria~bionic-log mariadb.org binary distribution

    Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

    MariaDB [(none)]> show variables like '%char%';
    +--------------------------+----------------------------+
    | Variable_name            | Value                      |
    +--------------------------+----------------------------+
    | character_set_client     | utf8mb4                    |
    | character_set_connection | utf8mb4                    |
    | character_set_database   | utf8mb4                    |
    | character_set_filesystem | binary                     |
    | character_set_results    | utf8mb4                    |
    | character_set_server     | utf8mb4                    |
    | character_set_system     | utf8                       |
    | character_sets_dir       | /usr/share/mysql/charsets/ |
    +--------------------------+----------------------------+
    8 rows in set (0.001 sec)

    MariaDB [(none)]> show variables like 'collation%';
    +----------------------+--------------------+
    | Variable_name        | Value              |
    +----------------------+--------------------+
    | collation_connection | utf8mb4_general_ci |
    | collation_database   | utf8mb4_general_ci |
    | collation_server     | utf8mb4_general_ci |
    +----------------------+--------------------+
    3 rows in set (0.000 sec)

    MariaDB [(none)]> show variables like 'log_output';
    +---------------+-------+
    | Variable_name | Value |
    +---------------+-------+
    | log_output    | FILE  |
    +---------------+-------+
    1 row in set (0.000 sec)

    MariaDB [(none)]> show variables like 'general_log';
    +---------------+-------+
    | Variable_name | Value |
    +---------------+-------+
    | general_log   | ON    |
    +---------------+-------+
    1 row in set (0.000 sec)

    MariaDB [(none)]> show variables like 'general_log_file';
    +------------------+----------------------------+
    | Variable_name    | Value                      |
    +------------------+----------------------------+
    | general_log_file | /var/log/mysql/general.log |
    +------------------+----------------------------+
    1 row in set (0.000 sec)

    MariaDB [(none)]> show variables like 'slow_query_log';
    +----------------+-------+
    | Variable_name  | Value |
    +----------------+-------+
    | slow_query_log | ON    |
    +----------------+-------+
    1 row in set (0.000 sec)

    MariaDB [(none)]> show variables like 'slow_query_log_file';
    +---------------------+-------------------------------+
    | Variable_name       | Value                         |
    +---------------------+-------------------------------+
    | slow_query_log_file | /var/log/mysql/slow_query.log |
    +---------------------+-------------------------------+
    1 row in set (0.000 sec)

    MariaDB [(none)]> show variables like 'long_query_time';
    +-----------------+-----------+
    | Variable_name   | Value     |
    +-----------------+-----------+
    | long_query_time | 10.000000 |
    +-----------------+-----------+
    1 row in set (0.000 sec)

    MariaDB [(none)]> show variables like 'log_error';
    +---------------+--------------------------+
    | Variable_name | Value                    |
    +---------------+--------------------------+
    | log_error     | /var/log/mysql/error.log |
    +---------------+--------------------------+
    1 row in set (0.000 sec)

    MariaDB [(none)]> show variables like 'innodb_ft_min_token_size';
    +--------------------------+-------+
    | Variable_name            | Value |
    +--------------------------+-------+
    | innodb_ft_min_token_size | 1     |
    +--------------------------+-------+
    1 row in set (0.001 sec)

    MariaDB [(none)]> exit                                      
    Bye

    root@9d9be88a96d6:/# ls -l /var/log/mysql
    total 5044
    -rw-rw---- 1 mysql adm    4536 Aug 31 14:26 error.log
    -rw-rw---- 1 mysql adm 5150282 Aug 31 14:28 general.log
    -rw-rw---- 1 mysql adm     385 Aug 31 14:26 slow_query.log

    root@9d9be88a96d6:/# exit

