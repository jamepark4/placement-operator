#!/bin/bash

assert_regex() {

    apiEndpoints=$(oc get -n openstack PlacementAPI  placement -o go-template-file="$1")
    echo $apiEndpoints
    matches=$(echo "$apiEndpoints" | sed -e "s?$2??")
    if [ -z "$matches" ]; then
        exit 0
    else
        exit 1
    fi
}

"$@"