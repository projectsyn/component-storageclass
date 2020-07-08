local kap = import 'lib/kapitan.libjsonnet';
local kube = import 'lib/kube.libjsonnet';
local inv = kap.inventory();
local sc = import 'lib/storage-class.libsonnet';

local params = inv.parameters.storage_class;

{
  [name]:
    sc.storageClass(name) + params.storageClasses[name]
  for name in std.objectFields(params.storageClasses)
}
