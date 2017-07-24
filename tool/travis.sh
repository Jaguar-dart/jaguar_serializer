#!/bin/bash

# Fast fail the script on failures.
set -e

chmod +x $(dirname -- "$0")/ensure_dartfmt.sh
# $(dirname -- "$0")/ensure_dartfmt.sh

dart bin/serializer.dart build

# Run vm tests
pub run test -p vm test/all_test.dart

# Run browser tests
if [ "${TRAVIS}" == "true" ]; then
  export DISPLAY=:99.0
  sh -e /etc/init.d/xvfb start
fi
pub serve test &
while ! nc -z localhost 8080; do sleep 1; done; echo 'pub serve is up!'
pub run test --pub-serve=8080 -p firefox test/all_browser_test.dart

# Run the build.dart file - just to make sure it works
#TODO dart --checked tool/build.dart

# Install dart_coveralls; gather and send coverage data.
# Re activate coverall when a solution arrive
# if [ "$COVERALLS_TOKEN" ] && [ "$TRAVIS_DART_VERSION" = "stable" ]; then
#   pub global activate dart_coveralls
#   pub global run dart_coveralls report \
#     --retry 2 \
#     --exclude-test-files \
#     test/test_all.dart
# fi
