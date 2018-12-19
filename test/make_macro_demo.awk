BEGIN {
    print "\\documentclass{article}"
    print "\\usepackage{../styles/lsstdesc_macros}"
    print "\\begin{document}"
    print "\\section*{{\\tt lsstdesc\\_macros.sty} demo}"
    print "\\begin{tabular}{|l|l|}"
    print "\\hline"
    split("x y z a b c", alph)
}

{
    y = match($0, /\\newcommand{(\\[a-zA-Z]+)}(\[)*([0-9]*)(\])*/, a)
    if (y!=0) {
	++n
	if (n % 45 == 0) {
	    print "\\hline"
	    print "\\end{tabular}"
	    print ""
	    print "\\begin{tabular}{|l|l|}"
	    print "\\hline"
	}
	com = a[1]
	#if ($0 ~ /\unit/) com = "7" com
	opts = ""
	nopts = a[3]
	if (nopts != "") {
	    gsub(/[\[\]]/, "", nopts)
	    for (i=1; i<=nopts; ++i) opts = opts "{" alph[i] "}"
	}
	#if ($0 ~ /\\xspace/ || $0 ~ /\unit/) opts = opts " word"
	print "\\verb|" com opts "|", "&", com opts, "\\\\"
    }
}

END {
    print "\\hline"
    print "\\end{tabular}"
    print ""
    print "\\end{document}"
}
