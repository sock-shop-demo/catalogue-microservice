#! /bin/bash
# exit script when any command ran here returns with non-zero exit code
set -e

echo "$STAGING_KUBERNETES_KUBECONFIG" | base64 --decode > kubeconfig.yml
envsubst < deployment.yml.template | tee deployment.yml
kubectl --kubeconfig=kubeconfig.yml get nodes
kubectl --kubeconfig=kubeconfig.yml apply -f deployment.yml