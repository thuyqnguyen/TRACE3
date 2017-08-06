#
# Cookbook Name:: trace3
# Recipe:: firewall
#
# Copyright (C) 2017 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# enable platform default firewall
firewall 'default' do
  action :install
  enabled true
end

# open standard http port:80
firewall_rule 'http' do
  port     80
  protocol :tcp
  source    '0.0.0.0/0'
  direction :in
  command   :allow
end

# open rdp port
firewall_rule 'rdp' do
  port     2000..2299
  protocol :tcp
  source    '0.0.0.0/0'
  direction :in
  command   :allow
end

