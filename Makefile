SHELL=/bin/bash

GOTOOLCHAIN=go1.24.4

.PHONY: clear prep perm

all: prep static perm

clear:
	rm -rf bin/*

prep:
	GOTOOLCHAIN=$(GOTOOLCHAIN) go mod tidy

static:
	GOOS=linux GOARCH=amd64 GOTOOLCHAIN=$(GOTOOLCHAIN) go build -buildvcs=false -o=bin/statictest-linux-amd64 -o=bin/statictest ./cmd/statictests/...

perm:
	chmod -R +x bin