# GitOps



## Git Authentication
```
export GIT_TOKEN=ghp_PcZ...IP0
export GIT_REPO=https://github.com/adilsonmenechini/gitops.git
```

## Command

```
argocd-autopilot repo bootstrap

INFO argocd initialized. password: sDfWP4qevo6u49EV
INFO run:

    kubectl port-forward -n argocd svc/argocd-server 8080:80

# projeto
argocd-autopilot project create ops

# Application
argocd-autopilot app create istio-ingress \
 --app https://istio-release.storage.googleapis.com/charts \
  -p ops --labels "istio-injection=enabled"  --dest-namespace istio-ingress \
  --type kustomize

```