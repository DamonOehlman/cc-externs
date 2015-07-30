#!/usr/bin/env bash

# set exit on error and tracing
# see https://gist.github.com/wolfeidau/6761104#file-pi-build-deb-sh-L3-L4
# set -e
# set -o errtrace
shopt -s nullglob

TARGET_EXTERN=$1
PATH_TESTS=test/$TARGET_EXTERN

function testCompile {
	echo "testing $1"

	java -jar node_modules/google-closure-compiler/compiler.jar \
		--jscomp_error accessControls \
		--jscomp_error checkRegExp \
		--jscomp_error checkTypes \
		--jscomp_error uselessCode \
		--jscomp_error checkVars \
		--jscomp_error const \
		--jscomp_error globalThis \
		--jscomp_error nonStandardJsDocs \
		--jscomp_error missingProperties \
		--jscomp_error strictModuleDepCheck \
		--jscomp_error suspiciousCode \
		--jscomp_error undefinedNames \
		--jscomp_error visibility \
		--jscomp_warning deprecated \
		--language_in ECMASCRIPT5 \
		--charset UTF-8 \
		--warning_level VERBOSE \
		--summary_detail_level 3 \
		--externs $TARGET_EXTERN.js \
		--js $1
}

for testfile in $PATH_TESTS/pass/*.js; do
	testCompile $testfile
	if [ $? -ne 0 ]; then
		echo "Captured FAIL for expected valid js: $testfile"
		exit 1;
	fi
done

for testfile in $PATH_TESTS/fail/*.js; do
	testCompile $testfile
	if [ $? -eq 0 ]; then
		echo "Captured PASS for expected invalid test: $testfile"
		exit 1;
	fi
done