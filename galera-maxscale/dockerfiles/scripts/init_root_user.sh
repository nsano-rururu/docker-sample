#!/bin/bash

set -e

# we use .sh file to create a .sql file, which will be parsed afterwards due to alphabetical sorting
config_file="/docker-entrypoint-initdb.d/init_root_user.sql"

# We start config file creation

cat <<EOF > $config_file
GRANT ALL PRIVILEGES on *.* to 'root'@'%' identified by '$MYSQL_ROOT_PASSWORD';
EOF