#!/usr/bin/env bash

# http://stackoverflow.com/questions/13690162/rails-postgres-fe-sendauth-no-password-supplied
# for user to be able to connect without a password
sudo cat /etc/postgresql/*/main/pg_hba.conf | sed -r 's/^local.*all.*postgres.*([a-z]+)/trust/'

# creates a user called jenkins who can create dbs
sudo -u postgres createuser jenkins --createdb --echo

sudo cat /etc/postgresql/*/main/pg_hba.conf | sed -r 's/^local.*all.*all.*([a-z]+)/md5/'

sudo service postgresql reload

# create a database for user to connect to
sudo -u jenkins createdb

echo "ALTER USER jenkins WITH PASSWORD 'jenkins'" | psql
