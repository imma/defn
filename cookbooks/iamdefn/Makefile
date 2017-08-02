all: style

style:
	foodcritic .
	cookstyle .

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
