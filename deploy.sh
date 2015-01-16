#!/bin/bash -eu

./openshift kube process -c application-template.json | ./openshift kube apply -c -
