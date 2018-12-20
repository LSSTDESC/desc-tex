Files to test out compilation of the DESC bibliography in various styles, and the DESC macros.

### Requirements

* All prerequisites for the Note class and the included bibliography styles for the PDF bibliography
* Python packages listed in [../requirements.txt](../requirements.txt) for the HTML bibliography
* All LaTeX packages included by `lsstdec_macros.sty`
* `gawk` for the macros demo

### Outputs

* `bibtest.pdf`: document in the DESC Note class that includes the DESC bibliography formatted in each of the available styles.
* `bibtest.html`: document listing the bibliography in the format used for the public DESC webpage
* `macro_demo.pdf`: document showing the invocation and output of macros defined in `lsstdesc_macros.sty`

Each of these is a possible target of the `Makefile`, in addition to:
* `default: bibtest macrotest`
* `bibtest: bibtest.pdf bibtest.html`
* `macrotest: macro_demo.pdf`
* `tidy:` remove temporary files
* `clean: tidy` and remove output files
