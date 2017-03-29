#!/bin/bash

CONF="/etc/ikvm.conf"

if ! [[ -r "${CONF}" ]]; then
    echo "Create file /etc/ikvm.conf with the content:"
    echo "USERNAME=Administrator"
    echo "PASSWORD_DEFAULT=secret"
    exit
fi

. ${CONF}

if [[ -z "$1" ]]; then
    echo "Usage: $0 <hostname>"
    exit
fi

if [[ "$1" == ${PATTERN_1} ]]; then
    password="${PASSWORD_1}"
else
    password="${PASSWORD_DEFAULT}"
fi

/usr/bin/java -Djava.library.path=/usr/lib/ipmiview/ -jar /usr/lib/ipmiview/iKVM.jar "${1}-ilo" "${USERNAME}" "${password}" null 5900 623 2 0 >/dev/null
