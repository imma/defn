all: style

style:
	foodcritic cookbooks
	cookstyle cookbooks

paranoid:
	kitchen test

up:
	kitchen create

down:
	kitchen destroy

provision:
	kitchen converge

verify:
	kitchen verify
