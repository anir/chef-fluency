package 'apache' do
	package_name 'httpd'

end

service 'httpd' do
 action [:enable, :start]
end

file '/var/www/index.html' do
	action :delete
end

file '/var/www/html/index.html' do
	content 'Hello Worlds!!!!!'
      	mode '0755'
      	owner 'root'
      	group 'apache'

end

file '/etc/motd' do
	content 'welcome to my server'
end


# not_if won't run the command since the file exists. only_if will execute since the file exists
execute 'command_test' do
	command 'echo blah!! >> /etc/motd'
	not_if 'test -r /etc/motd'
end
