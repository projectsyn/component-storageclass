local argocd = import 'lib/argocd.libjsonnet';

local app = argocd.App('storageclass', 'syn', secrets=false);

{
  storageclass: app,
}
