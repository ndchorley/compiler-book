#!/bin/bash

set -e

reflex lisp.l
clang++ -o lisp-scanner lex.yy.cpp libreflex.a
