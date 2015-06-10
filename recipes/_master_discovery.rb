

query = "recipe:#{node['locustio']['discovery_recipe']} AND chef_environment:#{node.chef_environment} AND locustio_node_type:master"
locust_master = search('node', query)

if locust_master.length == 0
  fail "Locust master discovery query returned no results: \n\t#{query}\n" 
else
  puts "Found Locust master node: ", locust_master
end

# TODO : Add attribute+condition to allow choosing between private or public address
node.default['locustio']['master_ip'] = locust_master[0]['ipaddress']
