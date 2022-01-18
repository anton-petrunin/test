cd Figs/mp/
mpost pic
cd ../..
pdflatex puzzles.tex
texindy -L russian -C utf8 puzzles.idx
biber puzzles
pdflatex puzzles.tex
