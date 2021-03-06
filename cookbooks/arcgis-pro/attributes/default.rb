#
# Cookbook Name:: arcgis-pro
# Attributes:: default
#
# Copyright 2015 Esri
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

default['arcgis']['pro']['version'] = '2.2'

default['arcgis']['repository']['archives'] = ENV['USERPROFILE'] + '\\Software\\Esri'
default['arcgis']['repository']['patches'] = node['arcgis']['repository']['archives'] + '\\Patches' 
default['arcgis']['repository']['setups'] = ENV['USERPROFILE'] + '\\Documents'
default['arcgis']['patches']['local_patch_folder'] = node['arcgis']['repository']['patches']

default['arcgis']['pro']['setup'] = ::File.join(node['arcgis']['repository']['setups'],
                              'ArcGIS ' + node['arcgis']['pro']['version'],
                              'Pro', 'ArcGISPro.msi')
default['arcgis']['pro']['install_dir'] = ENV['ProgramW6432'] + '\\ArcGIS\\Pro'
default['arcgis']['pro']['blockaddins'] = '#0'
default['arcgis']['pro']['portal_list'] = ''
default['arcgis']['pro']['allusers'] = 2
default['arcgis']['pro']['software_class'] = 'Viewer'
default['arcgis']['pro']['authorization_type'] = 'NAMED_USER'
default['arcgis']['pro']['esri_license_host'] = ENV['COMPUTERNAME']
default['arcgis']['pro']['authorization_file'] = ''
default['arcgis']['pro']['authorization_tool'] = ENV['ProgramW6432'] + '\\ArcGIS\\Pro\\bin\\SoftwareAuthorizationPro.exe'

case node['arcgis']['pro']['version']
when '1.2'
  default['arcgis']['pro']['product_code'] = '{44DED296-4D84-427B-9A5A-EC4D8C7A893B}'
when '1.3'
  default['arcgis']['pro']['product_code'] = '{6822F02D-F3CF-48C7-B6F5-EF9DA5841C88}'
when '1.4'
  default['arcgis']['pro']['product_code'] = '{639CDBC3-54D9-4218-B967-0191575CE3B6}'
when '2.0'
  default['arcgis']['pro']['product_code'] = '{28A4967F-DE0D-4076-B62D-A1A9EA62FF0A}'
when '2.1'
  default['arcgis']['pro']['product_code'] = '{0368352A-8996-4E80-B9A1-B1BA43FAE6E6}'
when '2.2'
  default['arcgis']['pro']['product_code'] = '{A23CF244-D194-4471-97B4-37D448D2DE76}'
else
  Chef::Log.warn "Unsupported ArcGIS Pro version"
end

default['arcgis']['pro']['authorization_file_version'] = node['arcgis']['pro']['version'].to_f.to_s


