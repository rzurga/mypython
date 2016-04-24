#
# Cookbook Name:: python
# Recipe:: activate_virtualenvwrapper
#
# Copyright 2016, rzurga (vagrant@zurga.com)
#
# All rights reserved - Do Not Redistribute
#

node[:users].each do |user_id|
    user_entry = search(:users, "id:" + user_id).first
    group_name = user_entry["group"] || node[:machine][:group] || user_id
    user_uid = user_entry["uid"] || node[:machine][:uid]
    home_dir = user_entry["home"] || node[:machine][:home] || "/home/" + user_id
    dev_dir = user_entry["dev"] || node[:machine][:dev] || home_dir + "/dev"
    virtualenvwrapper = user_entry["virtualenvwrapper"]
    
    unless virtualenvwrapper.nil?
        bash "activate virtualenvwrapper" do
            user user_id
            cwd home_dir
            code <<-EOD
                VIRTUALENVWRAPPER=$(which virtualenvwrapper.sh)
                # Fix reference ${.sh.file} in line #95
                sudo sed -i "s/{.sh.file}/{BASH}/g" $VIRTUALENVWRAPPER
                sudo su - #{user_id} -c $VIRTUALENVWRAPPER
            EOD
            action :run
        end
    end
    
    link dev_dir + '/virtualenv' do
        group group_name
        owner user_id
        to home_dir + '/.virtualenv'
    end
end