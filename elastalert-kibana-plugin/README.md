# Version

|Elasticsearch|Kibana|ElastAlert|ElastAlert Kibana Plugin|
|:-----------:|:----:|:--------:|:-----:|
|7.5.2        |7.5.2 |0.2.1     |1.10   |

# elastalert-kibana-plugin-1.1.0-7.5.2.zipを作成した時のコマンド

    curl -L -O https://github.com/bitsensor/elastalert-kibana-plugin/releases/download/1.1.0/elastalert-kibana-plugin-1.1.0-7.5.0.zip
    mv elastalert-kibana-plugin-1.1.0-7.5.0.zip elastalert-kibana-plugin-1.1.0-7.5.2.zip
    unzip elastalert-kibana-plugin-1.1.0-7.5.2.zip kibana/elastalert-kibana-plugin/package.json
    sed -i "s/7.5.0/7.5.2/g" kibana/elastalert-kibana-plugin/package.json
    zip elastalert-kibana-plugin-1.1.0-7.5.2.zip kibana/elastalert-kibana-plugin/package.json

# 準備

    mkdir -p elastalert/rules
    chmod 777 elastalert/rules
    mkdir -p elastalert/rule_templates
    chmod 777 elastalert/rule_templates
    mkdir -p es/data
    chmod 777 es/data

# 起動

    docker-compose up -d

# 参考情報

    # AWS Workspacesで全てが起動して使える状態になるまで約5分かかりました
    # 高スペックの環境ではもう少し速い時間で使える状態になると思われます。
    docker ps

    CONTAINER ID        IMAGE                                                 COMMAND                  CREATED             STATUS                   PORTS                                            NAMES
    c6da9f9a0839        bitsensor/elastalert:3.0.0-beta.0                     "npm start"              5 minutes ago       Up 5 minutes (healthy)   0.0.0.0:3030->3030/tcp, 0.0.0.0:3333->3333/tcp   elastalert
    748f0caecbd1        docker.elastic.co/kibana/kibana:7.5.2                 "/usr/local/bin/dumb…"   5 minutes ago       Up 5 minutes (healthy)   0.0.0.0:5601->5601/tcp                           kibana
    5a9d9f34faf3        docker.elastic.co/elasticsearch/elasticsearch:7.5.2   "/usr/local/bin/dock…"   5 minutes ago       Up 5 minutes (healthy)   0.0.0.0:9200->9200/tcp, 0.0.0.0:9300->9300/tcp   elasticsearch
