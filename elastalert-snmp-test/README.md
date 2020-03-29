# 起動

    docker-compose up -d

# SNMPTrap受信サーバー

    docker run -it --rm -p 162:162/udp --name snmptrapd sig9/snmptrapd