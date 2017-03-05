# Postgresql(9.5) instance for chado database
This is a source repository for [docker](http://docker.io) image primarily
designed to run [chado](http://gmod.org/wiki/Chado) database instance in
postgresql container. It is based on the generic alpine postgresql(9.5)
[image](https://hub.docker.com/_/postgres/). 

## Additional features/properties
It is __important__ to remember that building or running the image will not
instantiate a chado schema in the database.  Rather, the schema has to be
loaded after the container starts.

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
Provide a set of environmental variables to create a database and a
regular(not superuser) database user during the initialization process. Here
are the variables.

```
CHADO_USER 
CHADO_PASS
CHADO_DB
```

## Usage
It's identical to the base image, read the documentation
[here](https://hub.docker.com/_/postgres/)

## Deploy
The container is intended to be deployed in [kubernetes](http://kubernetes.io)
using [helm](https://github.com/kubernetes/helm). Use the corresponding
[chart](https://github.com/dictybase-docker/kubernetes-charts/tree/master/chado-postgres)
for  deployment. 

