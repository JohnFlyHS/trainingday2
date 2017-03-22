#
# Cookbook:: httpd
# Recipe:: configuration
#
# Copyright:: 2017, The Authors, All Rights Reserved.

file '/var/www/html/index.html' do
    content '<h1>Welcome Home!</h1>'
end