#!/bin/bash

set -e

CLUSTER_ADDRESS="gcomm://"

# we create a galera config
config_file="/etc/mysql/conf.d/galera.cnf"

cat <<EOF > $config_file
# Node specifics 
[mysqld] 
# next 3 params disabled for the moment, since they are not mandatory and get changed with each new instance.
# they also triggered problems when trying to persist data with a backup service, since also the config has to be 
# persisted, but HOSTNAME changes at container startup.
#wsrep-node-name = $HOSTNAME 
#wsrep-sst-receive-address = $HOSTNAME
#wsrep-node-incoming-address = $HOSTNAME

# Cluster settings
wsrep-on=ON
wsrep-cluster-name = "$CLUSTER_NAME" 
wsrep-cluster-address = $CLUSTER_ADDRESS
wsrep-provider = /usr/lib/galera/libgalera_smm.so 
wsrep-provider-options = "gcache.size=256M;gcache.page_size=128M;debug=no" 
wsrep-sst-auth = "$GALERA_USER:$GALERA_PASS" 
wsrep_sst_method = rsync
binlog-format = row 
default-storage-engine = InnoDB 
innodb-doublewrite = 1 
innodb-autoinc-lock-mode = 2 
innodb-flush-log-at-trx-commit = 2 
EOF