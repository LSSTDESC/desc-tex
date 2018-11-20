"""
Parse the LSST DESC bibtex file and write out the publication list as an html snippet, for inclusion on the public website.
"""

from __future__ import print_function
import bibtexparser

# ======================================================================

def lookup_journal(tex):
    """
    Return the name or acronym of the journal, given its tex macro.
    """
    plaintext = tex.replace('\\','')
    lookup = {'apj':'ApJ', 'apjs':'ApJS', 'aj':'AJ', 'mnras':'MNRAS', 'nature':'Nature', 'aap':'A&amp;A', 'pasp':'PASP', 'jcap':'JCAP'}
    try:
        journal = lookup[plaintext]
    except:
        journal = plaintext
    return journal

# ----------------------------------------------------------------------

def html_for(entry):
    """
    Return a single line of HTML displaying the bibtex entry provided, either to stdout or a file provided.
    """
    # First make the authorlist:
    names = entry['author'].replace('\n',' ').replace('{','').replace('}','').replace('~',' ').replace('\\','').replace("'",'').split(' and ')
    separator = ', '
    authorlist = separator.join(names)

    # Clean up the title:
    title = entry['title'].replace('{','').replace('}','')

    # Now get the journal details:
    journal = lookup_journal(entry['journal'])
    try:
        details = separator.join(['('+entry['year']+')', journal, entry['volume'], entry['pages']])+'.'
    except:
        details = separator.join(['('+entry['year']+')', journal])+'.'

    # And now the URLs:
    ADSurl = entry['adsurl']
    PDFurl = "https://arxiv.org/pdf/"+entry['eprint']
    bibcode = ADSurl.split('/')[-1]
    BIBurl = "http://adsabs.harvard.edu/cgi-bin/nph-bib_query?bibcode="+bibcode+"&amp;data_type=BIBTEX&amp;db_key=AST&amp;nocookieset=1"

    # Compose the single line string:
    line = '<li style="margin-bottom: 10px;">'+authorlist+' <em>"'+title+'"</em> '+details
    line += ' (<a href="'+ADSurl+'">ADS</a>, <a href="'+PDFurl+'">PDF</a>, <a href="'+BIBurl+'">bibtex</a>)'+'</li>'

    return line


# ======================================================================

if __name__ == '__main__':

    with open('../bib/lsstdesc.bib') as bibtex_file:
        db = bibtexparser.bparser.BibTexParser(common_strings=True).parse_file(bibtex_file)

    # Loop over the list of bibtex entries:
    print()
    for entry in db.entries:
        print(html_for(entry))
        print()

# ======================================================================
