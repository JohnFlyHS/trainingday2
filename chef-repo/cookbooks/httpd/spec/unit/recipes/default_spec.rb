#
# Cookbook:: httpd
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'httpd::default' do
  context 'When all attributes are default, on centos 6.7' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '6.7')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    
    it 'includes the install recipe' do
      expect(chef_run).to include_recipe('httpd::install')
    end
        
    it 'includes the configuration recipe' do
      expect(chef_run).to include_recipe('httpd::configuration')
    end  

    it 'includes the service recipe' do
      expect(chef_run).to include_recipe('httpd::service')
    end  
  end
end
