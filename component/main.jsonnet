local kap = import 'lib/kapitan.libjsonnet';
local kube = import 'lib/kube.libjsonnet';
local inv = kap.inventory();
local sc = import 'lib/storageclass.libsonnet';

local params = inv.parameters.storageclass;

{
  [name]:
    sc.storageClass(name) + params.classes[name]
  for name in std.objectFields(params.classes)
}
