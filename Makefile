TARGET=main
SLIDES=slides

MD:=$(wildcard *.md)
GENTEX:=$(MD:%.md=%.gen.tex)

%.gen.tex: %.md
	pandoc -t beamer -o $@ $<

paper:
	latexmk -pdf -bibtex $(TARGET)

slides:
	latexmk -pdf -bibtex $(SLIDES)

clean:
	latexmk -bibtex -C $(TARGET)
	latexmk -bibtex -C $(SLIDES)
