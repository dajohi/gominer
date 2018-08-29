#!/bin/bash
# The script does automatic checking on a Go package and its sub-packages, including:
# 1. gofmt         (http://golang.org/cmd/gofmt/)
# 2. gosimple      (https://github.com/dominikh/go-simple)
# 4. ineffassign   (https://github.com/gordonklaus/ineffassign)

# gometalinter (github.com/alecthomas/gometalinter) is used to run each each
# static checker.

set -ex

# Automatic checks
test -z "$(gometalinter --vendor --disable-all \
--enable=gofmt \
--enable=gosimple \
--enable=ineffassign \
--deadline=10m ./... | tee /dev/stderr)"
