FILE_TEX=main
DATESTAMP=`date +'%Y-%m-%d'`

all: compile

compile: clean
	pdflatex -shell-escape ${FILE_TEX}.tex
	pdflatex -shell-escape ${FILE_TEX}.tex
	bibtex ${FILE_TEX}
	pdflatex -shell-escape ${FILE_TEX}.tex
	pdflatex -shell-escape ${FILE_TEX}.tex
	pdflatex -shell-escape ${FILE_TEX}.tex
	pdflatex -shell-escape ${FILE_TEX}.tex
	mkdir -p time-machine/${DATESTAMP}
	cp ${FILE_TEX}.pdf time-machine/${DATESTAMP}/${FILE_TEX}.pdf
	make clean

view:
	evince time-machine/${DATESTAMP}/${FILE_TEX}.pdf &

clean:
	ls ${FILE_TEX}.* | grep -v \.tex$ | grep -v \.bib$ | grep -v \.tcp$ | grep -v \pdf$ |xargs rm -fv
	rm -fv *log *aux *dvi *lof *lot *bit *idx *glo *bbl *ilg *toc *ind *blg *out *nlo *brf *nls
	find . -regex '.*.aux' -print0 | xargs -0 rm -rfv
	find . -regex '.*.log' -print0 | xargs -0 rm -rfv
	find . -regex '.*.bbl' -print0 | xargs -0 rm -rfv
	find . -regex '.*.blg' -print0 | xargs -0 rm -rfv
	rm -rf _minted-main
