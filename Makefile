SHELL := /bin/bash
environment ?= dev
credentials_file ?= ~/.aws/credentials

# Make all targets phony: https://stackoverflow.com/a/63784549
.PHONY: $(shell sed -n -e '/^$$/ { n ; /^[^ .\#][^ ]*:/ { s/:.*$$// ; p ; } ; }' $(MAKEFILE_LIST))

.ONESHELL:
init:
	$(SHELL) ./tf_util.sh init $(environment)

.ONESHELL:
plan:
	$(SHELL) ./tf_util.sh plan $(environment)

.ONESHELL:
apply:
	$(SHELL) ./tf_util.sh apply $(environment)

.ONESHELL:
destroy:
	$(SHELL) ./tf_util.sh destroy $(environment)