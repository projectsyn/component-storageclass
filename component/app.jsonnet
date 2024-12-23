local argocd = import 'lib/argocd.libjsonnet';

local app = argocd.App('storageclass', 'syn', secrets=false);

local appPath =
  local project = std.get(app, 'spec', { project: 'syn' }).project;
  if project == 'syn' then 'apps' else 'apps-%s' % project;

{
  ['%s/storageclass' % appPath]: app,
}
