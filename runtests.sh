#!/usr/bin/env bash

# strict mode: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -uo pipefail
shopt -s nullglob
IFS=$'\n\t'

TARGET_EXTERN=$1
PATH_TESTS=test/$TARGET_EXTERN

echo -e "\n=== $1.js ==="

for testfile in $PATH_TESTS/pass/*.js; do
	echo -e "\n>>> checking $testfile"
	$(npm bin)/hardnosed-closure --externs *.js --js $testfile > /dev/null

	if [ $? -ne 0 ]; then
		echo "Captured FAIL for expected valid js: $testfile"
		exit 1;
	fi
done

for testfile in $PATH_TESTS/fail/*.js; do
	echo -e "\n>>> checking $testfile"
	$(npm bin)/hardnosed-closure --externs $TARGET_EXTERN.js --js $testfile > /dev/null 2>&1

	if [ $? -eq 0 ]; then
		echo "Captured PASS for expected invalid test: $testfile"
		exit 1;
	fi
done