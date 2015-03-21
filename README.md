# locust


##Description

This cookbook automates the provisionning of Locust load testing tool.


##Platforms

* Ubuntu 14.04

##Atributes

* `node['locustio']['node_type']` - Either 'standalone', 'master', or 'slave'
* `node['locustio']['base_url']` - The base url of the domain to test
* `node['locustio']['uri_list']` - Each array item is a hash specifying the following values: 'uri', 'weight', 'identifier'
* `node['locustio']['custom_test_file']` - Name of the locustio test scripte file which is created (default: virtual_user.py)
* `node['locustio']['custom_test_base_path']` - Path where the locust test scripts are placed
* `node['locustio']['custom_test_file_cookbook']` - cookbook from which the custom template can be found
* `node['locustio']['min_wait_time']` - Minimum time (in ms) to wait between requests
* `node['locustio']['max_wait_time']` - Maximum time (in ms) to wiat between requests
* `node['locustio']['log_file_dir']` - Directory where the log file is created

##Recipes

`hartfordfive-locustio::default`

##Usage Examples

* TODO


##Future Roadmap

* Add support for additional platforms (Ubuntu 12.04, Centos 6.5, Centos 7, Debian 7.7)

## Creator

Alain Lefebvre <hartfordfive 'at' gmail.com>


## License

Covered under the MIT lisense.
