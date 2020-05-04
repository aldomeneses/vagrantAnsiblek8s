#!/bin/bash

kubectl create secret docker-registry gcr-readonly-secret \
  --docker-server=https://gcr.io \
  --docker-username=_json_key \
  --docker-password="$(cat k8s-svcaccount.json)"

kubectl patch serviceaccount default -p \ '{"imagePullSecrets": [{"name": "gcr-readonly-secret"}]}'
