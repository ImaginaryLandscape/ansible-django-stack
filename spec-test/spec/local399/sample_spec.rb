require 'spec_helper'

# Test Vagrant Image
describe 'Vagrant Image Tests' do
  describe user('vagrant') do
    it { should exist }
    it { should belong_to_group 'vagrant' }
  end
end


# Test Base Packages
describe package('node-less'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end


# Test Tools Packsages
describe package('curl'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end
describe package('psmisc'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end
describe package('htop'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end
describe package('git'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end
describe package('tig'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end
describe package('mercurial'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end
describe package('psmisc'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end
describe package('lsof'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end
describe package('iptables-persistent'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end
describe package('unzip'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end
describe package('gettext'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end
describe package('tree'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end


# Test Docker Packages
describe package('docker-ce'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end
describe package('docker-ce-cli'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end


# Test Python Packages
describe package('python2.7'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end
describe package('python3'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end
describe package('python3.6'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end
describe package('python3.7'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end
describe package('python3.8'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end


# Test Letsencrypt Packages
describe package('certbot'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end


# Test Nginx Packages
describe package('nginx'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end


# Test Supervisor Packages
describe package('supervisor'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end


# Test Nagios NRPE Packages
describe package('nagios-nrpe-server'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end
describe package('nagios-plugins-standard'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end


# Test NTP Packages
describe package('ntp'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end


# Test Port 80
# describe port(80) do
#   it { should be_listening }
# end
