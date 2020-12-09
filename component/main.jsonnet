local com = import 'lib/commodore.libjsonnet';
local kap = import 'lib/kapitan.libjsonnet';
local kube = import 'lib/kube.libjsonnet';
local inv = kap.inventory();
local sc = import 'lib/storageclass.libsonnet';

local params = inv.parameters.storageclass;

{
  [name]:
    sc.storageClass(name) + com.makeMergeable(params.classes[name])
  for name in std.objectFields(params.classes)
} + {
  [if std.length(params.classes) == 0 then '.gitkeep']: {},
}
