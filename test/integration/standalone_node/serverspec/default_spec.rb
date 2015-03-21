require_relative 'spec_helper'

context 'LocustIO Load Testing Tool' do

  describe service('python') do
    it { should be_running }
  end

  describe port(8089) do
    it { should be_listening }
  end

  describe command('ps aux | grep python') do
    its(:stdout) { should match /locust/ }
  end

end

