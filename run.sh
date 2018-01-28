#!/bin/sh

namespace="hello-rails"

kubectl create namespace $namespace

kubectl create -n $namespace -f kube/secret.yaml
kubectl create -n $namespace -f kube/mysql.yaml
kubectl create -n $namespace -f kube/rails.yaml

ip=$(minikube ip)
port=$(kubectl -n $namespace -o=jsonpath='{.spec.ports[0].nodePort}' get service rails-service)

echo -e "\nhttp://$ip:$port"
