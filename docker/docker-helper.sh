#!/bin/bash

EXEC=$(basename $0)

function abort()
{
	echo "$EXEC: * ABORT: $*"
	exit 255
}

function info()
{
	echo "$*"
}

function error()
{
	echo "$EXEC: * ERROR: $*"
}

exit 0
#;
