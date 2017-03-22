#
# Cookbook Name:: httpd
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
package 'httpd'

httpd_vhost 'welcome' do
  site_name 'welcome'
  action :remove
end

httpd_vhost 'users' do
  site_name 'users'
  site_port 80
  action :create
end

httpd_vhost 'admins' do
  site_name 'admins'
  site_port 8080
  action :create
end

service 'httpd' do
  action [:enable, :start]
end
