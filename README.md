# Hackathon Template
Easy instructions for a Hackathon application.

# Table Of Contents
- [Overview](#overview)

# Overview
This is an example NodeJS serverless app.

To get started:

1. Download the OpenShift 4 CLI from https://mirror.openshift.com/pub/openshift-v4/clients/ocp/4.1.9/
2. Download Podman from https://podman.io
3. Fork this repository
4. Rename the repository
5. Change the `APP` variable in [`Makefile`](Makefile) to be the new name of the repository
6. Make a [Quay.io](https://quay.io) account
7. Change the `CONTAINER_USER` variable value in [`Makefile`](Makefile) to be
   your username
8. Make a public repository with the same name on Quay.io, this should match 
   the GitHub 
   repository name
10. Edit the `name`, `description`, `repository`, `author`, and `homepage` 
	fields in the [`package.json`](package.json)
11. Install NodeJS dependencies:
   ```
   yarn install
   ```
12. Add custom HTTP routes to `index.js`.
13. Run locally:
   ```
   node index.js
   ```
14. Ask an organizer for credentials to the Hackathon's Kubernetes cluster
15. Deploy:
   ```
   make deploy
   ```
