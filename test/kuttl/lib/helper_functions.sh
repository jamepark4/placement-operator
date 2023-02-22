#!/bin/bash

assert_regex() {

    apiEndpoints=$(oc get -n openstack PlacementAPI  placement -o go-template-file="$1")
    if [[ $apiEndpoints =~ $2 ]]; then
        exit 0
    else
        printf '%s\n' "Regex check $2 failed against: $apiEndpoints";
        exit 1
    fi
}

"$@"

adddate() {
    while IFS= read -r line; do
        printf '%s %s\n' "$(date)" "$line";
    done
}
