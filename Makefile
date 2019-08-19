.PHONY: docker \
	docker-build docker-push \
	docker-run

DOCKER_TAG_VERSION ?= <.DOCKER_TAG>
DOCKER_TAG_C ?= <.DOCKER_REPO>:${DOCKER_TAG_VERSION}


NAMESPACE ?= <.YOUR_NAMESPACE>
POD ?= staging-<.APP_NAME_IN_YAML>
PROD_POD ?= prod-<.APP_NAME_IN_YAML>



# Build and Push to docker hub
docker: docker-build docker-push

# build Docker image
docker-build:
	docker build -t ${DOCKER_TAG_C} .

# Push the docker image to docker hub
docker-push:
	docker push ${DOCKER_TAG_C}

# Runs the docker image on local machine
docker-run:
	docker run -it --rm --net host --entrypoint /bin/sh ${DOCKER_TAG_C}

#Staging the app
staging: docker staging-rollout

# Deploy code to Production:
production:
	./deploy/deploy.sh -n ${NAMESPACE} -p ${PROD_POD} -t prod

#deploy code to staging:
staging-rollout:
	./deploy/deploy.sh -n ${NAMESPACE} -p ${POD} -t staging


imagestream-tag:
	oc tag docker.io/${DOCKER_TAG_C} ${POD}:${DOCKER_TAG_VERSION} --scheduled
