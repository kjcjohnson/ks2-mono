#!/bin/sh

set -e

sbcl --disable-debugger --load "bootstrap.lisp" --load "ks2/build-helper.lisp" --eval "(build-app :public-release t)" --eval "(exit)"
sbcl --disable-debugger --load "bootstrap.lisp" --load "ks2/build-helper.lisp" --eval "(build-core)" --eval "(exit)"
