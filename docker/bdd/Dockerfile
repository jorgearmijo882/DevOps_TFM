FROM postgres:15-alpine

# Copiamos script de inicialización
COPY init.sql /docker-entrypoint-initdb.d/init.sql

# Exponemos el puerto por defecto
EXPOSE 5432