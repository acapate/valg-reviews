PANDOC=pandoc
PANDOC_ARGS=--to=../res/panbbcode.lua
TARGETS=grade.bb ex1.bb ex2.bb ex3.bb ex4.bb

all: $(TARGETS)

%.bb: %.md
	$(PANDOC) $(PANDOC_ARGS) -o $@ $<

clean:
	rm -f *.bb