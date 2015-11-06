#
# Cookbook Name:: chef-repo
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#


# # Node.jsのパッケージで必要なものをグローバルインストール
bash "install npm packages" do
  cwd "/home/vagrant"
  user "root"
  code <<-EOH
    npm install -g gulp bower
  EOH
end