#
# Cookbook Name:: trace3
# Recipe:: default
#
# Copyright (C) 2017 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'trace3::auto_update'
nclude_recipe 'trace3::windows'
include_recipe 'trace3::iis'
include_recipe 'trace3::firewall'
