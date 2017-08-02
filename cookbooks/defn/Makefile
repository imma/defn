all: install style

install:
	berks install
	berks update

style:
	foodcritic .
	cookstyle .
