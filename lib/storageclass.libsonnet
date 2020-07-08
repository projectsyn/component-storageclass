/**
 * \file Helper to create StorageClass objects.
 */

local com = import 'lib/commodore.libjsonnet';
local kap = import 'lib/kapitan.libjsonnet';
local kube = import 'lib/kube.libjsonnet';
local inv = kap.inventory();
local params = inv.parameters.storageclass;


/**
  * \brief Helper to create StorageClass objects.
           The `storageclass.kubernetes.io/is-default-class` annotation is automatically set based on `parameters.storageclass.defaultClass`.
           Defaults are used from `parameters.storageclass.defaults`.
  *
  * \arg The name of the StorageClass.
  * \return A StorageClass object.
  */
local storageClass(name) = kube._Object('storage.k8s.io/v1', 'StorageClass', name) {
  metadata+: {
    annotations+: {
      [if params.defaultClass == name then 'storageclass.kubernetes.io/is-default-class']: 'true',
    },
  },
} + params.defaults;


{
  storageClass: storageClass,
}
