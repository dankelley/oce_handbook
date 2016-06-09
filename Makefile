what=oce_handbook
$(what).pdf: $(what).tex
	latexmk -pdf $(what)
clean:
	-rm *~
	-rm -f $(what).aux
	-rm -f $(what).fdb_latexmk
	-rm -f $(what).fls
	-rm -f $(what).idx
	-rm -f $(what).ilg
	-rm -f $(what).ind
	-rm -f $(what).log
	-rm -f $(what).out
	-rm -f $(what).pdf
	-rm -f $(what).toc
	-rm -f texput.log

