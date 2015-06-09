#
# Cookbook Name:: locustio
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

include_recipe "apt::default"
include_recipe "runit"
include_recipe "python::default"

package "g++" do
  action :install
end

python_pip 'pyzmq'
python_pip 'locustio'


directory "/usr/local/share/locustio/logs" do
  owner "root"
  group "root"
  mode "0755"
  action :create
  recursive true
end

file "/usr/local/share/locustio/logs/output.log" do
  action :create
  owner "root"
  group "root"
  mode "0644"
end

if node['locustio']['node_type'] == 'slave'
  include_recipe "locustio::_master_discovery"
end

if node['locustio']['custom_test_file'] != nil
  node.default['locustio']['test_file'] = node['locustio']['custom_test_file']
  template "#{node['locustio']['custom_test_base_path']}/#{node['locustio']['custom_test_file'] }" do
    source "#{node['locustio']['custom_test_file']}.erb"
    cookbook node['locustio']['custom_test_file_cookbook']
    owner "root"
    group "root"
    mode "0644"
    notifies :restart, 'service[locustio-tester]'
  end
else
  node.default['locustio']['test_file'] = node['locustio']['default_test_file']
  template "/usr/local/share/locustio/#{node['locustio']['default_test_file']}" do
    source "#{node['locustio']['default_test_file']}.erb"
    owner "root"
    group "root"
    mode "0644"
    notifies :restart, 'service[locustio-tester]'
  end
end


runit_service "locustio-tester" do
  action [:enable, :start]
end

if node['locustio']['autostart']
  require 'net/http'
  require 'json'
  require 'uri'

  # curl --data "locust_count=[TOTAL_VIRTUAL_USERS]&hatch_rate=[NEW_USERS_PER_SECOND]" http://localhost:8089/swarm

  uri = URI.parse("http://localhost:#{node['locustio']['webui_port']}/swarm")
  https = Net::HTTP.new(uri.host,uri.port)
  https.use_ssl = false
  req = Net::HTTP::Post.new(uri.path, initheader = headers)
  body = "locust_count={total_virtual_users}&hatch_rate={hatch_rate}" % {
    total_virtual_users: node['locustio']['autostart_total_virtual_users'],
    hatch_rate: node['locustio']['autostart_hatch_rate']
  }
  req.body = "[ #{body} ]"
  res = https.request(req)

end



