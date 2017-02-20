#!/bin/bash -e
. /opt/bitnami/base/functions
. /opt/bitnami/base/helpers

print_welcome_page
check_for_updates &

chmod 644 /bitnami/mariadb/conf/my.conf

if [[ "$1" == "nami" && "$2" == "start" ]] || [[ "$1" == "/init.sh" ]]; then
  nami_initialize mariadb
  info "Starting mariadb..."
fi

exec tini -- "$@"
