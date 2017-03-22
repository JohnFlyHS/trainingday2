#
# Cookbook:: myiis_lb
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

all_web_nodes = search('node',"role:web AND chef_environment:#{node.chef_environment}")

members = []

all_web_nodes.each do |web_node|
  member = {
    'address' => web_node['ipaddress'],
    'weight' => 100,
    'port' => 80,
    'ssl_port' => 443
  }
  members.push(member)
end

node.default['iis-lb']['members'] = members

include_recipe 'iis-lb::default'