#
# Cookbook Name:: chef-repo
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# Node.jsのパッケージで必要なものをグローバルインストール
bash "install nodejs npm packages" do
  cwd "/home/vagrant"
  user "root"
  code <<-EOH
    curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
    sudo apt-get install -y nodejs
    sudo npm install -g gulp bower
  EOH
end

# githubからリポジトリをクローン
# git "/home/vagrant/myweb" do
#     repository "git://github.com/azureberry/myweb.git"
#     user "vagrant"
#     group "vagrant"
#     action :checkout
# end

# Node.jsのパッケージで必要なものをグローバルインストール
bash "install myproject" do
  cwd "/home/vagrant"
  user "vagrant"
  group "vagrant"
  code <<-EOH
    cp -a /vagrant/myweb .
    cd myweb
    bundle install
    sudo bower install --allow-root
    sudo npm install
    node node_modules/protractor/bin/webdriver-manager update
  EOH
end
