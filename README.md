# Postgresql(9.5) instance for intermine database
This is a source repository for [docker](http://docker.io) image primarily
designed to run [intermine backend](http://intermine.org) database instance in
postgresql container. It is based on the generic alpine postgresql(9.5)
[image](https://hub.docker.com/_/postgres/). 

### Configuration files
Adds bunch of fined grained database configurations that are available in
separate files. The following `conf` files are provided.

```
01resource.conf
02wal.conf
03query.conf
04.log.conf
05vaccum.conf
```

They get sourced in order by the main `postgresql.conf` file. 

### Environmental variables
## For creating superuser
It inherits all of
[them](https://github.com/docker-library/docs/tree/master/postgres#environment-variables).
In additions, it also allow them to be read from the corresponding file
variables.

```
POSTGRES_PASSWORD_FILE
POSTGRES_USER_FILE
POSTGRES_DB_FILE
POSTGRES_INIT_ARG_FILE
```

## For regular user
Provide a set of environmental variables to create a intermine databases and intermine
regular(not superuser) database user during the initialization process. Here
are the variables.

```
INTERMINE_USER 
INTERMINE_PASSWORD
INTERMINE_DB
INTERMINE_ITEMS_DB
INTERMINE_USERS_DB
```

## Usage
It's identical to the base image, read the documentation
[here](https://hub.docker.com/_/postgres/)

## Deploy
The container is intended to be deployed in [kubernetes](http://kubernetes.io)
using [helm](https://github.com/kubernetes/helm). Use the corresponding
[chart](https://github.com/dictybase-docker/kubernetes-charts/tree/master/dictymine-postgres)
for  deployment. 

