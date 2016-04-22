#
# Cookbook Name:: python
# Recipe:: activate_virtualenvwrapper.rb
#
# Copyright 2016, rzurga (vagrant@zurga.com)
#
# All rights reserved - Do Not Redistribute
#

include_recipe "chef-solo-search"

node[:users].each do |user_id|
    user_entry = search(:users, "id:" + user_id).first
    virtualenvwrapper =  = user_entry["virtualenvwrapper"]
    
    unless virtualenvwrapper.nil?
        bash "disable lock screen" do
            user user_id
            code "source virtualenvwrapper.sh"
            action :run
        end
    end
end