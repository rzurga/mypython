#
# Cookbook Name:: python
# Recipe:: anaconda
#
# Copyright 2016, rzurga (vagrant@zurga.com)
#
# All rights reserved - Do Not Redistribute
#

# Install Python stuff
package "python-dev" do
  action :install
end

package "python-pip" do
  action :install
end

bash "pip & vitualenv" do
  user "root"
  code <<-EOH
    #pip install --upgrade pip==1.5.6
    #pip install virtualenv==1.10.1
    pip install --upgrade pip
    pip install virtualenv
  EOH
end

package "g++" do
  action :install
end

bash "install pandas and requests" do
  user "root"
  code <<-EOH
    pip install --upgrade numpy
    pip install pandas
    pip install sqlalchemy
    pip install requests
    pip install --allow-external mysql-connector-python mysql-connector-python
    #pip install --upgrade requests[security]
    pip install pyopenssl ndg-httpsclient pyasn1
    apt-get install -y libffi-dev
    apt-get remove -y python-openssl
    apt-get install -y libssl-dev
    pip install "PyOpenSSL>=0.13"
  EOH
end

#bash "install iql" do
#  user "root"
#  code <<-EOH
#    #wget https://ishbook.corp.indeed.com/getmodule/iql.py
#  EOH
#end
#
#protobuf
#remote_file "protobuf-2.6.1.tar.gz" do
#  owner "root"
#  group "root"
#  mode 0755
#  path "/tmp/protobuf-2.6.1.tar.gz"
#  source "https://github.com/google/protobuf/releases/download/v2.6.1/protobuf-2.6.1.tar.gz"
#  action :create_if_missing
#end
#
#bash "install protobuf" do
#  user "root"
#  code <<-EOH
#    tar -xvf /tmp/protobuf-2.6.1.tar.gz -C /usr/lib
#    cd /usr/lib/protobuf-2.6.1
#    ./config
#    make
#    make check
#    make install
#  EOH
#end
