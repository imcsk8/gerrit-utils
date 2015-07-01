#!/bin/bash

cd /usr/share/openstack-puppet/
echo "Cleaning up before patching..."
rm -rf puppet-keystone.git
git clone https://github.com/stackforge/puppet-keystone.git puppet-keystone.git
cd puppet-keystone.git
echo "Applying support for keystone v3 api - v3 domain utility code"
# support for keystone v3 api - v3 domain utility code
git fetch https://ichavero@review.openstack.org/openstack/puppet-keystone refs/changes/85/178385/23 && git cherry-pick FETCH_HEAD
echo "Applying support for keystone v3 api - the domain resource"
# support for keystone v3 api - the domain resource
git fetch https://ichavero@review.openstack.org/openstack/puppet-keystone refs/changes/39/174439/35 && git cherry-pick FETCH_HEAD
echo "Applying support for keystone v3 api - the project resource"
# support for keystone v3 api - the project resource
git fetch https://ichavero@review.openstack.org/openstack/puppet-keystone refs/changes/68/174468/33 && git cherry-pick FETCH_HEAD
echo "Applying support for keystone v3 api - the user resource"
# support for keystone v3 api - the user resource
git fetch https://ichavero@review.openstack.org/openstack/puppet-keystone refs/changes/76/174976/29 && git cherry-pick FETCH_HEAD
echo "Applying support for keystone v3 api - the user_role resource"
# support for keystone v3 api - the user_role resource
git fetch https://ichavero@review.openstack.org/openstack/puppet-keystone refs/changes/99/174999/29 && git cherry-pick FETCH_HEAD
echo "Applying support for keystone v3 api - keystone and keystone::roles::admin"
# support for keystone v3 api - keystone and keystone::roles::admin
git fetch https://ichavero@review.openstack.org/openstack/puppet-keystone refs/changes/60/175060/34 && git cherry-pick FETCH_HEAD
echo "Applying support for keystone v3 api - make_keystone_user_role_name"
# support for keystone v3 api - make_keystone_user_role_name
git fetch https://ichavero@review.openstack.org/openstack/puppet-keystone refs/changes/55/193355/1 && git cherry-pick FETCH_HEAD
echo "Applying support for keystone v3 api - keystone::resource::authconfig"
# support for keystone v3 api - keystone::resource::authconfig
git fetch https://ichavero@review.openstack.org/openstack/puppet-keystone refs/changes/56/193356/1 && git cherry-pick FETCH_HEAD
echo "Applying support for keystone v3 api - resource::service_identity"
# support for keystone v3 api - resource::service_identity
git fetch https://ichavero@review.openstack.org/openstack/puppet-keystone refs/changes/57/193357/1 && git cherry-pick FETCH_HEAD
echo "Applying support for keystone v3 api - keystone::endpoint"
# support for keystone v3 api - keystone::endpoint
git fetch https://ichavero@review.openstack.org/openstack/puppet-keystone refs/changes/59/193359/1 && git cherry-pick FETCH_HEAD

echo "Patching finished"

echo "Creating symlink"
cd ../modules
rm -rf keystone
ln -s ../puppet-keystone.git keystone


