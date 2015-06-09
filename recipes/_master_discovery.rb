
query = "recipe:locustio AND chef_environment:#{node.chef_environment} AND locustio_node_type:master"
locust_master = search('node', query)
puts "***** Locust Master Node Detected: ", locust_master

fail "Backend declared with _discovery without search_query: #{query}" if locust_master.length == 0

node.default['locustio']['master_ip'] = locust_master[0]['ipaddress']
