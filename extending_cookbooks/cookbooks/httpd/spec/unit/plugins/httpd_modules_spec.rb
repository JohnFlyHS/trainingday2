require 'spec_helper'

class String
  def stdout
    self
  end
end

describe_ohai_plugin :Apache do
  let(:plugin_file) { 'files/default/httpd_modules.rb' }

  it 'provides apache/modules' do
    expect(plugin).to provides_attribute('apache/modules')
  end

  it 'correctly captures output' do
    allow(plugin).to receive(:shell_out).with('apachectl -t -D DUMP_MODULES').and_return('OUTPUT')
    expect(plugin_attribute('apache/modules')).to eq("OUTPUT")
  end
end
