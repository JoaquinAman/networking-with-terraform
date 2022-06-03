SHELL:=/bin/bash

## Local

.PHONY: config
config:
	# @cp -v .devcontainer/config $(HOME)/.ssh/
	git config --global --add safe.directory /workspaces/LDO02-terraform-basics
	alias tf=terraform
	alias m=make

## Terraform

.PHONY: init
init:
	@terraform init

.PHONY: validate
validate:
	@terraform validate

.PHONY: fmt
fmt:
	@terraform fmt

.PHONY: plan
plan:
	@terraform plan -out main.tfplan

apply: main.tfplan
	@terraform  apply main.tfplan

.PHONY: destroy
destroy:
	@terraform destroy