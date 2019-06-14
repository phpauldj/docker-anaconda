.DEFAULT_GOAL := help

## GENERAL ##
OWNER 				= paultabo
SERVICE_NAME 		= anaconda
VERSION         	= v1

## DEV ##
USER_ID  			?= $(shell id -u)
GROUP_ID 			?= $(shell id -g)

## DEPLOY ##
ENV 				?= dev

## RESULT_VARS ##
PROJECT_NAME		= $(OWNER)-$(ENV)-$(SERVICE_NAME)
IMAGE_ANACONDA		= $(PROJECT_NAME):anaconda
IMAGE_MINICONDA		= $(PROJECT_NAME):miniconda

build: ##@docker build image to dev and cli: make build
	docker build -f docker/anaconda.ubuntu/Dockerfile -t $(IMAGE_ANACONDA) docker/anaconda.ubuntu/
	docker build -f docker/miniconda.ubuntu/Dockerfile -t $(IMAGE_MINICONDA) docker/anaconda.ubuntu/

HELP_FUNC = \
	%help; \
	while(<>) { \
		if(/^([a-z0-9_-]+): .*\#\#(?:@(\w+))? ([a-zA-Z1-9\., ]+)(?: : (.*))?$$/) { \
			push(@{$$help{$$2}}, [$$1, $$3, $$4]); \
		} \
	}; \
	printf ("\033[31m %-30s %-45s %s\033[0m\n", "Target", "Help", "Usage"); \
	printf ("\033[31m %-30s %-45s %s\033[0m\n", "------", "----", "-----"); \
	for ( sort keys %help ) { \
		printf ("\033[33m%s:\033[0m\n", $$_); \
		printf("\033[32m %-20s\033[0m %-45s \033[34m%s\033[0m\n", $$_->[0], $$_->[1], $$_->[2]) for @{$$help{$$_}}; \
		print "\n"; \
	}

help:
	@perl -e '$(HELP_FUNC)' $(MAKEFILE_LIST)