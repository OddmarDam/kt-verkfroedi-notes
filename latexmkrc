# Build with:  latexmk exam-companion.tex   (output goes to .build/)
$pdf_mode = 1;
$out_dir = '.build';
$pdflatex = 'pdflatex -interaction=nonstopmode -synctex=1 %O %S';
$clean_ext = 'synctex.gz run.xml bcf fdb_latexmk';
