# GitOps



## Git Authentication
```
export GIT_TOKEN=ghp_PcZ...IP0
export GIT_REPO=https://github.com/adilsonmenechini/gitops.git
```

## Command

```
# create
argocd-autopilot repo bootstrap

# delete
argocd-autopilot repo uninstall

# projeto
argocd-autopilot project create ops

# application

argocd-autopilot app create argo-events --app github.com/argoproj-labs/argocd-autopilot/examples/demo-app/ -p ops --labels "istio-injection=enabled"  --dest-namespace argo-events


argocd-autopilot app create istio \
 --app https://istio-release.storage.googleapis.com/charts \
  -p ops --labels "istio-injection=enabled"  --dest-namespace istio \
  --type kustomize


argocd-autopilot app create monitoring/prometheus \
 --app https://prometheus-community.github.io/helm-charts \
 -p ops --dest-namespace monitoring --labels "istio-injection=enabled"\
 --type kustomize


argocd-autopilot app delete prometheus -p ops



kubectl port-forward -n argocd svc/argocd-server 8080:80


kubectl -n monitoring port-forward svc/kube-prometheus-stack-grafana 3000:80
kubectl get secret kube-prometheus-stack-grafana -o jsonpath="{.data.admin-password}" -n monitoring | base64 --decode ; echo

```