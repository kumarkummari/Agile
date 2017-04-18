#
# Cookbook:: orangehrm
# Recipe:: lamp_server
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package_name = node['organgehrm']['lampinstall']['package_name']
package_php = node['organgehrm']['lampinstall']['package_php']
apt_update 'update' do
    action :update
end

package package_name do
  action :install
end

package package_php do
    action :install
end

cookbook_file '/var/www/html/info.php' do
  source 'info.php'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end



