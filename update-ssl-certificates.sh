#!/bin/bash
#
# This is a simple script to automate the process of renewing LetsEncrypt SSL certificates 
# It renews any certificate that is due for renewal and restarts the webserver
#

WEBSERVER=nginx

if echo $( ./letsencrypt-auto renew -n ) | grep -xq 'No renewals were attempted.'
then
    # Restart webserver after the renewal to read-in the new certificates
    echo "Restarting $WEBSERVER, after certificate renewal(s)."
    service $WEBSERVER restart
else
    echo "Not restarting $WEBSERVER, as no certificates have been renewed."
fi;
