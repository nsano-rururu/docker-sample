# 準備

    mkdir -p elastalert/rule_templates
    chmod 777 elastalert/rule_templates
    mkdir -p es/data
    chmod 777 es/data
    mkdir -p mariadb/data
    chmod 777 mariadb/data
    mkdir -p mariadb/log
    chmod 777 mariadb/log

# 起動

    docker-compose up -d

# SNMPTrap受信サーバー

    docker run -it --rm -p 162:162/udp --name snmptrapd sig9/snmptrapd