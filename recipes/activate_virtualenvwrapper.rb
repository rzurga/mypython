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
    group_name = user_entry["group"] || node[:machine][:group] || user_id
    user_uid = user_entry["uid"] || node[:machine][:uid]
    home_dir = user_entry["home"] || node[:machine][:home] || "/home/" + user_id
    dev_dir = user_entry["dev"] || node[:machine][:dev] || home_dir + "/dev"
    virtualenvwrapper = user_entry["virtualenvwrapper"]
    
    unless virtualenvwrapper.nil? do
        bash "activate virtualenvwrapper" do
            user user_id
            code "source virtualenvwrapper.sh"
            action :run
        end
    end
    
    link dev_dir + 'virtualenv' do
        owner user_id
        to home_dir + '/.virtualenv'
    end
end