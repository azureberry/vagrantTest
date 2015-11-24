# -*- encoding: utf-8 -*-

require 'spec_helper'

describe 'check packages' do
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

  pkgs.each do |pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end

  pkgs_gem = [
    'bundler',
    'sass',
    'serverspec'
  ]

  pkgs_gem.each do |pkg|
    describe package(pkg) do
      it { should be_installed.by('gem') }
    end
  end

  pkgs_npm = [
    'gulp',
    'bower'
  ]

  pkgs_npm.each do |pkg|
    describe package(pkg) do
      it { should be_installed.by('npm') }
    end
  end

end

describe 'サービス開始されていること' do
  describe service('xvfb') do
    it { should be_enabled }
    # it { should be_running }
  end
end

################################

describe '[install nodejs npm packages]' do
  # apt-get install nodejs
  #      -> pkgs
  # npm install -g
  #      -> pkgs_npm
end

describe '[git] gitからリポジトリをチェックアウトされていること' do
  describe file('/home/vagrant/myweb/') do
    it { should be_directory }
  end
end

describe '[install myproject] リポジトリ内セットアップが完了していること' do
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
end

describe '[install serverspec packages]' do
  # gem install
  #      -> pkgs_gem
  #      -> pkgs
end