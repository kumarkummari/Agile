#
# Cookbook:: orangehrm
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe 'orangehrm::lamp_server'
include_recipe 'orangehrm::orange_deploy'
include_recipe 'orangehrm::mysql_server'
