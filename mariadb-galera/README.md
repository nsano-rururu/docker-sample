# Version

|MariaDB|
|:-----:|
|10.4.12|

# 動作確認

    $ docker-compose up -d

    $ docker-compose exec node-1 mysql -e "create database test_db"
    $ docker-compose exec node-2 mysql -e "show databases"
    +--------------------+
    | Database           |
    +--------------------+
    | information_schema |
    | mysql              |
    | performance_schema |
    | test               |
    | test_db            |
    +--------------------+

    $ docker-compose exec node-3 mysql -e "show databases"
    +--------------------+
    | Database           |
    +--------------------+
    | information_schema |
    | mysql              |
    | performance_schema |
    | test               |
    | test_db            |
    +--------------------+
