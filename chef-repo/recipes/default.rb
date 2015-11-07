#
# Cookbook Name:: chef-repo
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# githubからリポジトリをクローン
git "/home/vagrant/myweb" do
    repository "git://github.com/azureberry/myweb.git"
    user "vagrant"
    action :checkout
end

# Node.jsのパッケージで必要なものをグローバルインストール
bash "install npm packages" do
  cwd "/home/vagrant/myweb"
  user "vagrant"
  code <<-EOH
    sudo npm install -g gulp bower
    bundle install
    sudo bower install -f --allow-root
    # sudo npm install
  EOH
end
