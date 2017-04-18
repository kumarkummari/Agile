#
# Cookbook:: orangehrm
# Recipe:: mysql_server
#
# Copyright:: 2017, The Authors, All Rights Reserved.
# To install mysql client
apt_update "mysqlupdate" do
    action :update
end

mysql_client 'default' do
  action :create
end

mysql_service 'default' do
  version '5.5'
  bind_address '0.0.0.0'
  port '3306'
  data_dir '/data'
  initial_root_password 'password'
  action [:create, :start]
end

