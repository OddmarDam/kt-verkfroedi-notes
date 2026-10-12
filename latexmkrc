# Build from the repo root, one document at a time:
#   latexmk -r latexmkrc -outdir=.build/discrete-math discrete-math/exam-companion.tex
# The shared class and style files live in latex/.
ensure_path('TEXINPUTS', './latex//');
$pdf_mode = 1;
$pdflatex = 'pdflatex -interaction=nonstopmode -synctex=1 %O %S';
$clean_ext = 'synctex.gz run.xml bcf fdb_latexmk';
