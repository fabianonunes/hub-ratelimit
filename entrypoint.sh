#!/bin/bash

auth="$1"

repo="ratelimitpreview/test"
url_token="https://auth.docker.io/token?service=registry.docker.io&scope=repository:${repo}:pull"
url_pull="https://registry-1.docker.io/v2/${repo}/manifests/latest"

bearer_token=$(curl --silent ${auth:+--user "$auth"} "${url_token}" | jq --raw-output .token)
auth_header="Authorization: Bearer ${bearer_token}"

curl --head --silent --verbose --header "${auth_header}" "${url_pull}" 2>&1 | grep -E '< (HTTP|RateLimit)'
