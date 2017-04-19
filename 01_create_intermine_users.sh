#!/bin/bash
set -xe

create_intermine_role_and_db() {
    if [ "${INTEMINE_USER+defined}" -a "${INTERMINE_PASSWORD+defined}" -a "${INTERMINE_DB+defined}" ]
    then
        psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
            CREATE ROLE $INTERMINE_USER WITH CREATEDB LOGIN ENCRYPTED PASSWORD '$INTERMINE_PASSWORD';
            CREATE DATABASE $INTERMINE_DB OWNER $INTERMINE_USER;
EOSQL
    fi
}

create_intermine_items_db() {
    if [ "${INTEMINE_USER+defined}" -a "${INTERMINE_PASSWORD+defined}" -a "${INTERMINE_ITEMS_DB+defined}" ]
    then
        psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
            CREATE DATABASE $INTERMINE_ITEMS_DB OWNER $INTERMINE_USER;
EOSQL
    fi
}

create_intermine_userprofile_db() {
    if [ "${INTEMINE_USER+defined}" -a "${INTERMINE_PASSWORD+defined}" -a "${INTERMINE_USERS_DB+defined}" ]
    then
        psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
            CREATE DATABASE $INTERMINE_USERS_DB OWNER $INTERMINE_USER;
EOSQL
    fi
}


main() {
    create_intermine_role_and_db
    create_intermine_items_db
    create_intermine_userprofile_db
}

main



