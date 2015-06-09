
locust_master = search('node', "recipe:locustio AND chef_environment:#{node.chef_environment} AND locustio_node_type:master")

fail "Backend declared with _discovery without search_query: #{backend_object.inspect}" if locust_master.length == 0

node.default['locustio']['master_ip'] = locust_master[0]['ipaddress']
