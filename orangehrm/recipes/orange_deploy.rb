#
# Cookbook:: orangehrm
# Recipe:: orange_deploy
#
# Copyright:: 2017, The Authors, All Rights Reserved.
# package_phpexe = ['organgehrm']['lampinstall']['package_php']
remote_file '/var/tmp/orangehrm.zip' do
  source 'https://excellmedia.dl.sourceforge.net/project/orangehrm/stable/3.3.3/orangehrm-3.3.3.zip'
  owner 'root'
  group 'root'
  mode '0755'
  action :create_if_missing
end

zipfile '/var/tmp/orangehrm.zip' do
  into '/var/www/html/'
  not_if { ::File.exist?('/var/www/html/orangehrm-3.3.3/index.php') || ::File.exist?('/var/www/html/orangehrm/index.php')}
end

execute 'rename' do
  command 'mv /var/www/html/orangehrm-3.3.3 /var/www/html/orangehrm'
  only_if { ::File.exist?('/var/www/html/orangehrm-3.3.3/index.php') }
  action :run
end

execute 'permissions' do
   command 'chmod 777 /var/www/html/orangehrm/index.php'
   action :run
  # notifies :reload, "service [#{package_phpexe}]"
end