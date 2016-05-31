oce_handbook.pdf: oce_handbook.tex appeals.tex
	latexmk -pdf oce_handbook
clean:
	-rm *~
	-rm oce_handbook.pdf



