#
# Cookbook Name:: python
# Recipe:: google_api
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

user_id = node[:machine][:user]
group_name = node[:machine][:group]
home_dir = node[:machine][:home]
dev_node = node[:machine][:dev]
bashrz = home_dir + ".bashrz"

bash "install google-api-python-client" do
  user "root"
  cwd home_dir
  code <<-EOD
    pip install --upgrade google-api-python-client
  EOD
  action :run
end

bash "get google-data" do
  user user_id
  cwd home_dir + '/dev'
  code <<-EOD
    git clone https://github.com/google/gdata-python-client.git
    git clone https://github.com/guyc/py-gaugette.git
  EOD
  action :run
end

bash "install data-python-client" do
  user "root"
  cwd home_dir + '/dev/gdata-python-client'
  code <<-EOD
    python setup.py install
  EOD
  action :run
end

bash "install py-gaugette" do
  user "root"
  cwd home_dir + '/dev/py-gaugette'
  code <<-EOD
    python setup.py install
  EOD
  action :run
end
