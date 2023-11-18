#!/bin/bash
set -e
rm -rf /app/tmp/pids/server.pid
echo "mysql -h $DB_HOST -P $MYSQL_DBPORT -u $MYSQL_USERNAME -p$MYSQL_PASSWORD"
echo "Starting Club App"
if [[ $LOAD_DBDUMP -eq 1 ]]; then
    dbdump=./dev_seed_dump/club_recruitment_development.sql
    head $dbdump
    echo "Dropping existing Database"
    echo "DROP DATABASE IF EXISTS $MYSQL_DBNAME" | mysql -h $DB_HOST -P $MYSQL_DBPORT -u $MYSQL_USERNAME -p$MYSQL_PASSWORD
    echo "Recreating Database"
    echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DBNAME" | mysql -h $DB_HOST -P $MYSQL_DBPORT -u $MYSQL_USERNAME -p$MYSQL_PASSWORD
    echo "Loading database dump $dbdump"
    mysql -h $DB_HOST -P $MYSQL_DBPORT -u $MYSQL_USERNAME -p$MYSQL_PASSWORD  $MYSQL_DBNAME < $dbdump
    echo "Database dump loaded"
fi
echo "Migrating Database" 
bundle exec rake db:migrate --trace 
echo "Starting Rails Server" 
rails server -b 0.0.0.0 -p 3000
