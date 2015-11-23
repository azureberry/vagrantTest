require 'spec_helper'


describe package('g++') do
  it { should be_installed }
end

describe package('ruby') do
  it { should be_installed }
end

# describe package('bundler') do
#   it { should be_installed }
# end

describe package('git') do
  it { should be_installed }
end

describe package('openjdk-7-jdk') do
  it { should be_installed }
end

describe package('google-chrome-stable') do
  it { should be_installed }
end

describe package('xvfb') do
  it { should be_installed }
end

describe package('nodejs') do
  it { should be_installed }
end


describe service('xvfb') do
  it { should be_enabled }
  # it { should be_running }
end


# describe port(80) do
#   it { should be_listening }
# end

describe file('/home/vagrant/myweb/bower_components') do
  it { should be_directory }
end

describe file('/home/vagrant/myweb/node_modules') do
  it { should be_directory }
end
