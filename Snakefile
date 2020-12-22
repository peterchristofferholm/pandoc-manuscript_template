rule all:
    input: expand("manuscript.{ext}", ext=["pdf", "html", "docx"])

#------------------------------------------------------------------------------

sections = (
    "sections/frontmatter.yaml",
    "sections/abstract.md", 
    "sections/introduction.md", 
    "sections/methods.md", 
    "sections/results.md",
    "sections/discussion.md", 
    "sections/references.md"
)

#------------------------------------------------------------------------------

rule pdf_output:
    input: "looks/looks.yaml",  sections
    resources:
        bibfile = "references/references.bib",
        cslfile = "references/evolution.csl"
    output: "manuscript.pdf"
    shell: """
        pandoc {input} -o {output} --citeproc \
            -t latex --pdf-engine=xelatex \
            --bibliography={resources.bibfile} \
            --csl={resources.cslfile}
    """

rule docx_output:
    input: looks="looks/looks.docx",  text=sections
    resources:
        bibfile = "references/references.bib",
        cslfile = "references/evolution.csl"
    output: "manuscript.docx"
    shell: """
        pandoc {input.text} -o {output} --citeproc \
            -t docx --reference-doc={input.looks} \
            --bibliography={resources.bibfile} \
            --csl={resources.cslfile}
    """

rule html_output:
    input: looks="looks/looks.css",  text=sections
    resources:
        bibfile = "references/references.bib",
        cslfile = "references/evolution.csl"
    output: "manuscript.html"
    shell: """
        pandoc {input.text} -o {output} --citeproc \
            -t html --katex --css {input.looks} --standalone \
            --bibliography={resources.bibfile} \
            --csl={resources.cslfile}
    """
