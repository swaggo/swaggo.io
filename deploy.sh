#!/bin/bash
set -e

if [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_BRANCH" == master ]; then
    exit 0
fi

make publish
