#!/usr/bin/env bash

# set exit on error and tracing
# see https://gist.github.com/wolfeidau/6761104#file-pi-build-deb-sh-L3-L4
set -e
set -o errtrace

TARGET_EXTERN=$1

function testCompile {
	java -jar tools/compiler.jar \
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

testCompile test/$TARGET_EXTERN/pass/valid-target.js
testCompile test/$TARGET_EXTERN/fail/invalid-target.js