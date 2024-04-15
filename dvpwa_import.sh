#!/bin/bash
set -euxo pipefail

# import github/harness-community/dvpwa to my-web-app

curl -s "https://app.harness.io/gateway/code/api/v1/repos/import?routingId=${MY_HARNESS_ACCOUNT}&space_path=${MY_HARNESS_ACCOUNT}%2F${MY_HARNESS_ORG}%2F${MY_HARNESS_PROJECT}" \
  -H 'X-Api-Key: '$MY_HARNESS_PAT'' \
  -H 'accept: */*' \
  -H 'content-type: application/json' \
  -X POST \
  --data @<(cat <<EOF
    {
    "description":"",
    "parent_ref":"${MY_HARNESS_ACCOUNT}/${MY_HARNESS_ORG}/${MY_HARNESS_PROJECT}",
    "uid":"my-web-app",
    "provider":{
        "type":"github",
        "username":"",
        "password":"${GITHUB_TOKEN}",
        "host":""
        },
    "provider_repo":"harness-community/dvpwa",
    "pipelines":"ignore"
    }
EOF
)
