#!/bin/bash

set -e

reflex lisp.l
clang++ -I $REFLEX_INCLUDE_PATH -o lisp-scanner \
	lex.yy.cpp $REFLEX_LIB_PATH/libreflex.a
