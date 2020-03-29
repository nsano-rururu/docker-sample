# Version

|MariaDB|Maxscale|
|:-----:|:-----:|
|10.4.12|2.4.2|

# 動作確認

    $ cd dockerfiles
    $ docker build -t mariadb-galera:10.4.12 .
    $ cd ..
    $ docker-compose up -d
    $ docker-compose exec maxscale maxctrl list servers
    ┌─────────┬─────────┬──────┬─────────────┬─────────────────────────┬──────┐
    │ Server  │ Address │ Port │ Connections │ State                   │ GTID │
    ├─────────┼─────────┼──────┼─────────────┼─────────────────────────┼──────┤
    │ server1 │ node-1  │ 3306 │ 0           │ Master, Synced, Running │      │
    ├─────────┼─────────┼──────┼─────────────┼─────────────────────────┼──────┤
    │ server2 │ node-2  │ 3306 │ 0           │ Slave, Synced, Running  │      │
    ├─────────┼─────────┼──────┼─────────────┼─────────────────────────┼──────┤
    │ server3 │ node-3  │ 3306 │ 0           │ Slave, Synced, Running  │      │
    └─────────┴─────────┴──────┴─────────────┴─────────────────────────┴──────┘
    $ docker stop node-1
    $ docker-compose exec maxscale maxctrl list servers
    ┌─────────┬─────────┬──────┬─────────────┬─────────────────────────┬──────┐
    │ Server  │ Address │ Port │ Connections │ State                   │ GTID │
    ├─────────┼─────────┼──────┼─────────────┼─────────────────────────┼──────┤
    │ server1 │ node-1  │ 3306 │ 0           │ Down                    │      │
    ├─────────┼─────────┼──────┼─────────────┼─────────────────────────┼──────┤
    │ server2 │ node-2  │ 3306 │ 0           │ Master, Synced, Running │      │
    ├─────────┼─────────┼──────┼─────────────┼─────────────────────────┼──────┤
    │ server3 │ node-3  │ 3306 │ 0           │ Slave, Synced, Running  │      │
    └─────────┴─────────┴──────┴─────────────┴─────────────────────────┴──────┘
    $ docker restart node-1
    $ docker-compose exec maxscale maxctrl list servers
    ┌─────────┬─────────┬──────┬─────────────┬─────────────────────────┬──────┐
    │ Server  │ Address │ Port │ Connections │ State                   │ GTID │
    ├─────────┼─────────┼──────┼─────────────┼─────────────────────────┼──────┤
    │ server1 │ node-1  │ 3306 │ 0           │ Master, Synced, Running │      │
    ├─────────┼─────────┼──────┼─────────────┼─────────────────────────┼──────┤
    │ server2 │ node-2  │ 3306 │ 0           │ Slave, Synced, Running  │      │
    ├─────────┼─────────┼──────┼─────────────┼─────────────────────────┼──────┤
    │ server3 │ node-3  │ 3306 │ 0           │ Slave, Synced, Running  │      │
    └─────────┴─────────┴──────┴─────────────┴─────────────────────────┴──────┘
