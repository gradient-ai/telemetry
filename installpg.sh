# install prometheus and grafana
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
helm install prometheus prometheus-community/prometheus -f override.yaml # make sure override.yaml is within the same directory. 
helm install grafana grafana/grafana 

# expose nodeports
kubectl expose service prometheus-server --type=NodePort --target-port=9090 --name=prometheus-server-ext
kubectl expose service grafana --type=NodePort --target-port=3000 --name=grafana-ext
