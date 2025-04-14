# import config.
# You can change the default config with `make cnf="config_special.env" build`
cnf ?= .env
-include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

#------------------------------------------------------------------------------#

build-dist:
	rm -rf dist/; \
	python3 setup.py sdist bdist_wheel; \
	pip uninstall -y mysql-checksum; \
	pip install ./dist/*-py3-none-any.whl --force-reinstall; \
	pip list | grep mysql

bump-patch:
	bumpversion patch setup.py && \
		git push
bump-minor:
	bumpversion minor setup.py && \
		git push
bump-major:
	bumpversion major setup.py && \
		git push

push-tags:
	git push --tags origin
