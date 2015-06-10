

default['locustio']['node_type'] = 'standalone' # standalone, master, or slave
default['locustio']['total_nodes'] = 1
default['locustio']['base_url'] = nil
default['locustio']['uri_list'] = []
default['locustio']['default_test_file'] = 'virtual_user.py'
default['locustio']['custom_test_file'] = nil
default['locustio']['custom_test_file_cookbook'] = 'locustio'
default['locustio']['custom_test_base_path'] = '/usr/local/share/locustio'
default['locustio']['min_wait_time'] = 1000
default['locustio']['max_wait_time'] = 4000
default['locustio']['log_file_dir'] = '/usr/local/share/locustio/logs'
default['locustio']['default_test_file'] = 'virtual_user.py'
default['locustio']['test_file'] = nil
default['locustio']['autostart'] = false
default['locustio']['autostart_total_virtual_users'] = 40
default['locustio']['autostart_hatch_rate'] = 3
default['locustio']['webui_port'] = 8089
default['locustio']['discovery_recipe'] = 'locustio'
default['locustio']['cluster_name'] = 'locust-default'
