kubectl create -f runtimeClass.yaml

kubectl create ns fosdem24

kubectl apply -f knative.yaml
curl 
kubectl get pods -n fosdem24