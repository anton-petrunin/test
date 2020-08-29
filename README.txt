pdflatex puzzles.tex
texindy -L russian -C utf8 puzzles.idx
pdflatex puzzles.tex

eyo --lint algorithms-sol.tex algorithms.tex combinatorics.tex combinatorics-sol.tex games.tex games-sol.tex geography.tex geography-sol.tex geometry.tex geometry-sol.tex handicaps.tex handicaps-sol.tex intuition.tex intuition-sol.tex more-games.tex more-games-sol.tex numbers.tex numbers-sol.tex preface.tex probability.tex probability-sol.tex toughies.tex toughies-sol.tex unsolved.tex unsolved-sol.tex
