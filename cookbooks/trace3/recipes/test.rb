#
# Cookbook Name:: trace3
# Recipe:: test
#
# Copyright (C) 2017 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

docroot = 'c:\tmp'
start_page = "#{docroot}\index.html"
start_page_loc = 'https://github.com/colebemis/feather.git'

directory  docroot do
  action :create
  recursive true
  rights :full_control, "Thuy", :applies_to_children => true
end

remote_file start_page do
#remote_file 'C:\tmp\index.html' do
  source start_page_loc
  #source 'https://github.com/colebemis/feather.git'
  mode '0755'
  action :create
end