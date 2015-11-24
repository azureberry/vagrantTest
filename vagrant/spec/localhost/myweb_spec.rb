require 'spec_helper'

pkgs = [
  'g++',
  'ruby',
  'git',
  'openjdk-7-jdk',
  'google-chrome-stable',
  'xvfb',
  'nodejs',
  'rake'
]

for pkg in pkgs do
  describe package(pkg) do
    it { should be_installed }
  end
end

pkgs_gem = [
  'bundler',
  'sass',
  'serverspec'
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


################################

#  [install nodejs npm packages]
# apt-get install nodejs
#      -> pkgs
# npm install -g
#      -> pkgs_npm


# [git] gitからリポジトリをチェックアウトされていること
describe file('/home/vagrant/myweb/') do
  it { should be_directory }
end


# [install myproject] リポジトリ内セットアップが完了していること
# bundle install
#      ->pkgs_gem

# bower install
# npm install
# node node_modules/protractor/bin/webdriver-manager update
# build_copy.sh
files = [
  '/home/vagrant/myweb/bower_components',
  '/home/vagrant/myweb/node_modules',
  '/home/vagrant/myweb/node_modules/protractor/selenium/chromedriver',
  '/home/vagrant/myweb/src/img'
]
for f in files do
  describe file(f) do
    it { should exist }
  end
end

# [install serverspec packages]
# gem install
#      -> pkgs_gem
#      -> pkgs