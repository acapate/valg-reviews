PANDOC=pandoc
PANDOC_ARGS=--to=../res/panbbcode.lua
TARGETS=grade.bb

all: $(TARGETS)

%.bb: %.md
	$(PANDOC) $(PANDOC_ARGS) -o $@ $<

clean:
	rm -f *.bb