#!/usr/bin/env bash

set -o errexit

: ${1?"Usage: $0 <TEAM NAME>"}

TEAM_NAME=$1
TEMPLATE="team1"
REPO_ROOT=$(git rev-parse --show-toplevel)
TEAM_DIR="${REPO_ROOT}/cluster/${TEAM_NAME}/"

mkdir -p ${TEAM_DIR}

cp -r "${REPO_ROOT}/cluster/${TEMPLATE}/." ${TEAM_DIR}


find ${TEAM_DIR} -type f -exec sed -i "s/$TEMPLATE/$TEAM_NAME/g" {} \;

echo "${TEAM_NAME} created at ${TEAM_DIR}"
echo "  - ./${TEAM_NAME}/" >> "${REPO_ROOT}/cluster/kustomization.yaml"
echo "${TEAM_NAME} added to ${REPO_ROOT}/cluster/kustomization.yaml"
