#!/bin/sh

mkdir -p /usr/local/share/ca-certificates/certs
chmod -R 755 /usr/local/share/ca-certificates/certs

# Check if the SSL certificate files exist
if [ -f "/etc/ssl/certs/odh-ca-bundle.crt" ]; then
    echo "SSL certificate found, proceeding..."
    cp /etc/ssl/certs/odh-ca-bundle.crt /usr/local/share/ca-certificates/certs/odh-ca-bundle.crt
else
    echo "SSL certificate not found"
    mkdir -p /usr/local/share/ca-certificates/certs
    touch /usr/local/share/ca-certificates/certs/odh-ca-bundle.crt
    echo \
'-----BEGIN CERTIFICATE-----
<certificate-content-here>
-----END CERTIFICATE-----' >> /usr/local/share/ca-certificates/certs/odh-ca-bundle.crt
    update-ca-certificates
    export REQUESTS_CA_BUNDLE=/usr/local/share/ca-certificates/certs/odh-ca-bundle.crt 
    if [ -f "/usr/local/share/ca-certificates/certs/odh-ca-bundle.crt" ]; then
        echo "exists"
    fi
    cat /usr/local/share/ca-certificates/certs/odh-ca-bundle.crt
    echo $REQUESTS_CA_BUNDLE
fi


torchrun /test/mnist.py
