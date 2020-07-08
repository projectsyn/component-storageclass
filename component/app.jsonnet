local argocd = import 'lib/argocd.libjsonnet';

local app = argocd.App('storage-class', 'syn');

{
  'storage-class': app,
}
