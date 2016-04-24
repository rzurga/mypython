#
# Cookbook Name:: python
# Recipe:: pycharm
#
# Copyright 2016, rzurga (vagrant@zurga.com)
#
# All rights reserved - Do Not Redistribute
#

package "software-properties-common" do
  action :install
end

bash "Install PyCharm" do
  user "root"
  code <<-EOD
    add-apt-repository -y ppa:mystic-mirage/pycharm
    apt-get update
    apt-get install -y pycharm
  EOD
end
