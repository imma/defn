all: style

install:
	berks install
	berks update

style:
	foodcritic .
	cookstyle .

run:
	chef-client -c .chef/client.rb
