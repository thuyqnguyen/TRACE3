#
# Cookbook Name:: trace3
# Recipe:: iis
#
# Copyright (C) 2017 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# stop and delete the default site
iis_site 'Default Web Site' do
  action [:stop, :delete]
end

# create and start a new site
site_name ='icons'

#rootDir
directory "#{node['iis']['docroot']}/#{site_name}" do
  action :create
  recursive true
  rights :full_control, "Administrator", :applies_to_children => true
end

#defaultpage
default_page_location = 'https://github.com/colebemis/feather.git'

remote_file "#{node['iis']['docroot']}/#{site_name}/index.html"  do
  source default_page_location
  mode '0755'
  action :create_if_missing
  notifies :restart, "iis_site[#{site_name}]", :delayed
end

iis_site site_name do
  protocol :http
  port 80
  path "#{node['iis']['docroot']}/#{site_name}"
  action [:add,:start]
end