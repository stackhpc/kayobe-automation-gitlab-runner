#!/bin/bash

set -eux
state_file=$1

GITLAB_USER="${GITLAB_USER:-will70}"
GITLAB_PROJECT="${GITLAB_PROJECT:-28023768}"

terraform init \
    -backend-config="address=https://gitlab.com/api/v4/projects/$GITLAB_PROJECT/terraform/state/$state_file" \
    -backend-config="lock_address=https://gitlab.com/api/v4/projects/$GITLAB_PROJECT/terraform/state/$state_file/lock" \
    -backend-config="unlock_address=https://gitlab.com/api/v4/projects/$GITLAB_PROJECT/terraform/state/$state_file/lock" \
    -backend-config="username=$GITLAB_USER" \
    -backend-config="password=$GITLAB_TOKEN" \
    -backend-config="lock_method=POST" \
    -backend-config="unlock_method=DELETE" \
    -backend-config="retry_wait_min=5" \
    -reconfigure
