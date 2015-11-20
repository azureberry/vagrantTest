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
git "/home/vagrant/myweb" do
    repository "git://github.com/azureberry/myweb.git"
    user "vagrant"
    group "vagrant"
    # action :checkout
end

# リポジトリ内セットアップ
bash "install myproject" do
  cwd "/home/vagrant/myweb"
  user "vagrant"
  group "vagrant"
  code <<-EOH
    bundle install
    sudo bower install --allow-root
    sudo npm install
    node node_modules/protractor/bin/webdriver-manager update
    chmod u+x build_copy.sh
    ./build_copy.sh
  EOH
end
