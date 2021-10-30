#!/bin/bash
# Create a dated Markdown file at a specific location.
#
# Usage:
#   $ drafts some post idea
#
# Produces:
#   YYYY-MM-DD-some-post-idea.md in your $DRAFTS_DIRECTORY (this is set below).
#
# from: https://nickjanetakis.com/blog/i-tried-linux-as-my-main-dev-environment-but-was-forced-back-to-windows

set -e

# Edit this to match your environment.
readonly DRAFTS_DIRECTORY="/d/src/sites/nickjanetakis/_drafts"

readonly DRAFTS_FILE="$(date +%Y-%m-%d)-${*}.md"
readonly DRAFTS_PATH="${DRAFTS_DIRECTORY}/${DRAFTS_FILE// /-}"

if [[ $# -eq 0 ]]; then
    ls "${DRAFTS_DIRECTORY}"
    exit 0
fi

if [ -e "${DRAFTS_PATH}" ]; then
    eval "${EDITOR}" "${DRAFTS_PATH}"
else
    touch "${DRAFTS_PATH}"
fi
