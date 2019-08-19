# Kscout Hack Template


## Setup
Check `secrets.yaml` file in `deploy/templates` for reference

_All the secrets should be in `base64` format in the `secrets.yaml`_ \
_Your secrets file should always be gitignored and dockerignored to avoid leaking secrets_

## RUN

### Build the docker image 
`make docker-build`

### Run the docker image on local machine
`make docker-run` \
_The default entrypoint while running the docker image on local machine is `/bin/sh`_


### Upload the docker image to dockerhub
`make docker-push`

### Build and Upload the docker image to repository 
`make docker`

### Deploy the image to kubernetes/knative cluster
*Make sure you have knative installed on the cluster* 

#### Deploy the image to `Staging`
`make staging` \
*It creates a docker image from your current working directory and uploads it to docker hub before depolying the image* \

**If you are looking to deploy to staging without building and pushing docker image, use** \
`make staging-rollout`

#### Deploy the image to `Production`
`make production` \
*Takes the latest `production` image from docker hub to deploy* \
Make sure you have `github webhooks` configured on `dockerhub`



## Misc.
* To change the default namespace and docker repository see `Makefile`
