.PHONY: deploy container run

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

NAMESPACE ?= ${CONTAINER_USER}-${APP}

# Deploy app to cluster
deploy: container
	${OC_CLI} project ${NAMESPACE} || ${OC_CLI} new-project ${NAMESPACE}
	${OC_CLI} apply -n ${NAMESPACE} -f deployment/service.yaml

# Build and push container
container:
	${CONTAINER_CLI} build -t ${CONTAINER_REPO} .
	${CONTAINER_CLI} push ${CONTAINER_REPO}

# Run app locally
run:
	yarn install
	./index.js
