all: style

install:
	berks install
	berks update

style:
	foodcritic .
	cookstyle .

run:
	chef-client -c .chef/client.rb

test:
	kitchen test

up:
	kitchen create

down:
	kitchen destroy

provision:
	kitchen converge

verify:
	kitchen verify
