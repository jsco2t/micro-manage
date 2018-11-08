#!/bin/bash

# check to make sure `helpers.sh` is sourced
if [ ! -n "$(type showDoc)" ]; then
    source /scripts/helpers.sh
fi

delayed-report-done() {
    sleep $1

    echo ""
    echo "########"
    echo "Portal access has ended, please run 'k8scmd portal' to start a new session"
    echo "########"
    echo ""
}

launch-portal() {

    requestedTimeout=3600 # 1 hr
    
    if [[ ! -z "$1" ]]; then
        requestedTimeout=$1
    fi

    (timeout -t $requestedTimeout kubectl proxy --accept-hosts '.*' --address 0.0.0.0 &) 1>/dev/null
    delayed-report-done $requestedTimeout &

    echo ""
    echo "########"
    echo "Portal proxy has started"
    echo "########"
    echo ""
}

portal(){
    showDoc "/documents/k8scmd/portal.md"

    launch-portal
}

