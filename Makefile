
VPATH = looks sections references figures

TEXTDIR = sections
REFDIR = references

frontmatter = $(TEXTDIR)/frontmatter.yaml
markdown = abstract.md introduction.md methods.md \
		results.md discussion.md references.md 
text = $(addprefix $(TEXTDIR)/, $(markdown))
bibfile = $(REFDIR)/references.bib
cslfile = $(REFDIR)/evolution.csl
commonfiles = $(frontmatter) $(text) $(bibfile) $(cslfile)

looks_latex = looks/looks.yaml
looks_docx = looks/looks.docx
looks_css = looks/looks.css


manuscript.pdf : $(commonfiles) $(looks_latex) 
	pandoc -o $@ \
		-t latex \
		--pdf-engine=xelatex \
		--filter pandoc-citeproc --bibliography=$(bibfile) --csl=$(cslfile) \
		$(looks_latex) $(frontmatter) $(text)

manuscript.docx : $(commonfiles) $(looks_docx)
	pandoc -o $@ \
		-t docx \
		--reference-doc=$(looks_docx) \
		--filter pandoc-citeproc --bibliography=$(bibfile) --csl=$(cslfile) \
		$(frontmatter) $(text)

manuscript.html : $(commonfiles) $(looks_css)
	pandoc -o $@ \
		-t html --standalone \
		--katex \
		--filter pandoc-citeproc --bibliography=$(bibfile) --csl=$(cslfile) \
		--css $(looks_css) \
		$(frontmatter) $(text)

all : manuscript.pdf manuscript.docx manuscript.html
