#
# Cookbook Name:: python
# Recipe:: virtualenv
#
# Copyright 2016, rzurga (vagrant@zurga.com)
#
# All rights reserved - Do Not Redistribute
#

bash "pip & vitualenv" do
  user "root"
  code <<-EOH
    . /etc/profile.d/anaconda-env.sh
    pip install virtualenv
    pip install virtualenvwrapper
  EOH
end
