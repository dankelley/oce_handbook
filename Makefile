oce_handbook.pdf: oce_handbook.tex
	latexmk -pdf oce_handbook
clean:
	-rm *~


