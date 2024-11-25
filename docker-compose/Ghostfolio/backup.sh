#!/bin/bash

# vars
BACKUP_DIR=/opt/ghostfolio/backup
NUM_BACKUPS_TO_KEEP=10

# create backup directory
mkdir -p ${BACKUP_DIR}

# create backup
docker exec -it ghostfolio-postgres-1 pg_dump --clean -U user -d ghostfolio-db > ${BACKUP_DIR}/dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql

# delete old backups
ls -t ${BACKUP_DIR}/dump_*.sql | tail -n +$((${NUM_BACKUPS_TO_KEEP} + 1)) | xargs -I {} rm {}