#!/usr/bin/env bash

set -ev

go test -v -covermode=count -coverprofile=coverage.out