#!/usr/bin/env bash

if [ -f /etc/.mmonit_installed ]; then
    # script has been run already
    exit 0
fi

host={{ mmonit_setup_url }}
logfile=/etc/mmonit_setup.log

function error_exit {
    cat $logfile
	echo "$1" 1>&2
	exit 1
}


# create secure cookie storage
mkdir -p -m 0700 ~/.mmonit || error_exit "Cannot create ~/.mmonit"

# go to login page to retrieve cookie
curl --insecure -c ~/.mmonit/cookie ${host}/index.csp > $logfile || error_exit "Cannot retrieve login cookie"

# login
curl --insecure -b ~/.mmonit/cookie \
 -d z_username=admin \
 -d z_password=swordfish \
 -d z_csrf_protection=off \
 ${host}/z_security_check >> $logfile || error_exit "Cannot create ~/.mmonit"

# Create admin
curl --insecure -b ~/.mmonit/cookie \
 -d uname='{{ mmonit_admin_username }}' \
 -d fullname='Administrator' \
 -d password='{{ mmonit_admin_password }}' \
 -d admin=1 \
 ${host}/admin/users/create >> $logfile || error_exit "Create admin failed"

# Create monit user
curl --insecure -b ~/.mmonit/cookie \
 -d uname='{{ mmonit_connector_username }}' \
 -d fullname='monit' \
 -d password='{{ mmonit_connector_password }}' \
 -d admin=0 \
 ${host}/admin/users/create >> $logfile || error_exit "Cannot mmonit user failed"

# Delete default admin
curl --insecure -b ~/.mmonit/cookie \
 -d uname=admin \
 ${host}/admin/users/delete >> $logfile || error_exit "Cannot delete default mmonit admin"

# Delete default monit user
curl --insecure -b ~/.mmonit/cookie \
 -d uname=monit \
 ${host}/admin/users/delete >> $logfile || error_exit "Cannot delete default mmonit user"

# Check if configuration is successful
curl --insecure -b ~/.mmonit/cookie ${host}/admin/users/list | grep '{{ mmonit_connector_username }}' || error_exit "Cannot retrieve login cookie"

# mark installation as success
touch /etc/.mmonit_installed || error_exit "Cannot mark installation as success"

# logout
curl --insecure -b ~/.mmonit/cookie ${host}/login/logout.csp || error_exit "Cannot logout"

exit 0
