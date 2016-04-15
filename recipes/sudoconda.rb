#
# Cookbook Name:: python
# Recipe:: sudoconda
#
# Copyright 2016, rzurga (vagrant@zurga.com)
#
# All rights reserved - Do Not Redistribute
#

# Makes Python under sudo the same as whichever is installed
# for everyone else

cookbook_file "/home/vagrant/vs.sh" do
  source 'vs.sh'
  owner 'vagrant'
  group 'vagrant'
  mode '0755'
  action :create
end


bash "Modify secure_path in sudoers file" do
  user "vagrant"
  code <<-EOD
    . /etc/profile.d/anaconda-env.sh
    /home/vagrant/vs.sh
  EOD
end
