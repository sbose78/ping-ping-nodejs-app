# Hackathon Template
Easy instructions for a Hackathon application.

# Table Of Contents
- [Overview](#overview)

# Overview
This is an example NodeJS serverless app.

To get started:

0. Download the OpenShift 4 CLI from https://mirror.openshift.com/pub/openshift-v4/clients/ocp/4.1.9/
0. Download Podman from https://podman.io
1. Fork this repository
2. Rename the repository
3. Change the `APP` variable in [`Makefile`](Makefile) to be the new name of the repository
4. Make a [Quay.io](https://quay.io) account
5. Change the `CONTAINER_USER` variable value in [`Makefile`](Makefile) to be your username
6. Make a repository with the same name on Quay.io, this should match the GitHub 
   repository name
7. Install NodeJS dependencies:
   ```
   yarn install
   ```
8. Add custom HTTP routes to `index.js`.
9. Run locally:
   ```
   node index.js
   ```
10. Ask an organizer for credentials to the Hackathon's Kubernetes cluster
11. Deploy:
   ```
   make deploy
   ```
