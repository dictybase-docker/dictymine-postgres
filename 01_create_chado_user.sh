#!/bin/bash
set -x

create_chado_user() {
    file_env 'CHADO_USER'
    file_env 'CHADO_PASS'
    file_env 'CHADO_DB'

    if [ "${CHADO_USER+defined}" -a "${CHADO_PASS+defined}" -a "${CHADO_DB+defined}" ]
    then
        psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
            CREATE ROLE $CHADO_USER WITH CREATEDB LOGIN ENCRYPTED PASSWORD '$CHADO_PASS';
            CREATE DATABASE $CHADO_DB OWNER $CHADO_USER;
EOSQL
    fi
}

main() {
    create_chado_user
}

main



