.PHONY: deploy container

# !!!CHANGE THESE VALUES!!!
# APP = Name of your Quay.io and GitHub repository
APP ?= serverless-example-nodejs

# CONTAINER_USER = Your Quay.io username
CONTAINER_USER ?= kscout

# You probably don't need to touch anything below here
OC_CLI ?= oc
CONTAINER_CLI ?= podman

CONTAINER_VERSION ?= latest
CONTAINER_REPO ?= quay.io/${CONTAINER_USER}/${APP}:${CONTAINER_VERSION}

deploy:
	${CONTAINER_CLI} build -t ${CONTAINER_REPO} .
	${CONTAINER_CLI} push ${CONTAINER_REPO}
	${OC_CLI} project ${APP}
	${OC_CLI} apply -n ${APP} -f deployment/service.yaml
