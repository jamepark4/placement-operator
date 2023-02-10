#!/bin/bash

assert_regex() {

    apiEndpoints=$(oc get -n openstack KeystoneAPI  keystone -o go-template="$1")
    matches=$(echo "$apiEndpoints" | sed -e "s?$2??")
    if [ -z "$matches" ]; then
        exit 0
    else
        exit 1
    fi
}
