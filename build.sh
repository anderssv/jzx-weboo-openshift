#!/bin/bash -eu

./openshift kube apply -c docker-registry-config.json
./openshift kube create buildConfigs -c application-buildconfig.json
curl -s -A "GitHub-Hookshot/github" -H "Content-Type:application/json" -H "X-Github-Event:push" -d @github-webhook-example.json http://localhost:8080/osapi/v1beta1/buildConfigHooks/build101/secret101/github

echo "Build started..."
echo ""
echo "To monitor if it's done: ./openshift kube list builds"
echo " "