#!/usr/bin/env bash

# strict mode: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -uo pipefail
shopt -s nullglob
IFS=$'\n\t'

# define the --jscomp_error flags we want to use
JSCOMP_ERRORS=(
	accessControls
	checkRegExp
	checkTypes
	uselessCode
	checkVars
	const
	globalThis
	nonStandardJsDocs
	missingProperties
	strictModuleDepCheck
	suspiciousCode
	undefinedNames
	visibility
)

# define the --jscomp_warning flags
JSCOMP_WARNINGS=(
	deprecated
)

function genClosureArgs() {
	ARGS=()
	for flag in ${JSCOMP_ERRORS[@]}; do
		ARGS+=(--jscomp_error $flag)
	done

	for flag in ${JSCOMP_WARNINGS[@]}; do
		ARGS+=(--jscomp_warning $flag)
	done

	ARGS+=(--language_in ECMASCRIPT5)
	ARGS+=(--charset UTF-8)
	ARGS+=(--warning_level VERBOSE)
	ARGS+=(--summary_detail_level 3)
	ARGS+=(--compilation_level ADVANCED_OPTIMIZATIONS)

	echo "${ARGS[*]}"
}

TARGET_EXTERN=$1
PATH_TESTS=test/$TARGET_EXTERN
CLOSURE_JAR="node_modules/google-closure-compiler/compiler.jar"

echo "running bash $BASH_VERSION"
echo -e ">>> running tests for $1.js externs"

for testfile in $PATH_TESTS/pass/*.js; do
	echo -e "\n>>> checking $testfile"
	java -jar $CLOSURE_JAR $(genClosureArgs) --externs $TARGET_EXTERN.js --js $testfile > /dev/null

	if [ $? -ne 0 ]; then
		echo "Captured FAIL for expected valid js: $testfile"
		exit 1;
	fi
done

for testfile in $PATH_TESTS/fail/*.js; do
	echo -e "\n>>> checking $testfile"
	java -jar $CLOSURE_JAR $(genClosureArgs) --externs $TARGET_EXTERN.js --js $testfile > /dev/null 2>1

	if [ $? -eq 0 ]; then
		echo "Captured PASS for expected invalid test: $testfile"
		exit 1;
	fi
done