#!/bin/bash
set -e

create_extension_citext() {
    if [ "${CHADO_DB+defined}" ]
    then
        psql -v ON_ERROR_STOP=1 --username ${POSTGRES_USER} --dbname ${CHADO_DB} <<-EOSQL
            CREATE EXTENSION citext;
EOSQL
    fi
}

main() {
    create_extension_citext
}

main
