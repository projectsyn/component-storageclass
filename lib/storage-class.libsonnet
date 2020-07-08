/**
 * \file Helper to create StorageClass objects.
 */

local com = import 'lib/commodore.libjsonnet';
local kap = import 'lib/kapitan.libjsonnet';
local kube = import 'lib/kube.libjsonnet';
local inv = kap.inventory();
local storage_class_params = inv.parameters.storage_class;


/**
  * \brief Helper to create StorageClass objects.
           The `storageclass.kubernetes.io/is-default-class` annotation is automatically set based on `parameters.storage_class.defaultClass`.
           Defaults are used from `parameters.storage_class.defaults`.
  *
  * \arg The name of the StorageClass.
  * \return A StorageClass object.
  */
local storageClass(name) = kube._Object('storage.k8s.io/v1', 'StorageClass', name) {
  metadata+: {
    annotations+: {
      [if storage_class_params.defaultClass == name then 'storageclass.kubernetes.io/is-default-class']: 'true',
    },
  },
} + storage_class_params.defaults;


{
  storageClass: storageClass,
}
