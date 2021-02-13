FLAGS=-default-type int64 -default-type word64

.PHONY: main.mlton main.mpl

all: main.mpl

main.mlton:
	mlton $(FLAGS) -output $@ main.mlb
main.mpl:
	mpl $(FLAGS) -output $@ main.mpl.mlb
