#!/bin/sh

set -e

if [ -z "$CROWDIN_ACCESS_TOKEN" ]; then
  echo "CROWDIN_ACCESS_TOKEN is not set. Quitting."
  exit 1
fi

if [ -z "$CROWDIN_PROJECT_BRANCH_ID" ]; then
  echo "CROWDIN_PROJECT_BRANCH_ID is not set. Quitting."
  exit 1
fi

if [ -z "$CROWDIN_PROJECT_ID" ]; then
  echo "CROWDIN_PROJECT_ID is not set. Quitting."
  exit 1
fi

# Default to us-east-1 if AWS_REGION not set.
if [ -z "$DEPLOY_PATH" ]; then
  DEPLOY_PATH="./deploy-target"
fi

export CROWDIN_ACCESS_TOKEN=$CROWDIN_ACCESS_TOKEN
export CROWDIN_PROJECT_BRANCH_ID=$CROWDIN_PROJECT_BRANCH_ID
export CROWDIN_PROJECT_ID=$CROWDIN_PROJECT_ID
export DEPLOY_PATH=$DEPLOY_PATH

java -Xmx2G -jar crowdincopydeploy.jar