all: style

install:
	berks install
	berks update

style:
	foodcritic .
	cookstyle .

run:
	chef-client -c .chef/client.rb

kitchen:
	kitchen destroy || true
	kitchen setup

test:
	kitchen test

converge:
	kitchen converge

verify:
	kitchen verify
