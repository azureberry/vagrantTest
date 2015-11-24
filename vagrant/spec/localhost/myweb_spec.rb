require 'spec_helper'

pkgs = [
  'g++',
  'ruby',
  'git',
  'openjdk-7-jdk',
  'google-chrome-stable',
  'xvfb',
  'nodejs'
]

for pkg in pkgs do
  describe package(pkg) do
    it { should be_installed }
  end
end

pkgs_gem = [
  'bundler',
  'sass',
  'serverspec',
  'rake'
]

for pkg in pkgs_gem do
  describe package(pkg) do
    it { should be_installed.by('gem') }
  end
end

pkgs_npm = [
  'gulp',
  'bower'
]

for pkg in pkgs_npm do
  describe package(pkg) do
    it { should be_installed.by('npm') }
  end
end

# サービス開始されていること
describe service('xvfb') do
  it { should be_enabled }
  # it { should be_running }
end


# describe port(80) do
#   it { should be_listening }
# end

# gitからリポジトリをチェックアウトされていること
describe file('/home/vagrant/myweb/') do
  it { should be_directory }
end


# リポジトリ内セットアップが完了していること
# bower install
describe file('/home/vagrant/myweb/bower_components') do
  it { should be_directory }
end

# npm install
describe file('/home/vagrant/myweb/node_modules') do
  it { should be_directory }
end

# build_copy.sh
describe file('/home/vagrant/myweb/src/img') do
  it { should be_directory }
end