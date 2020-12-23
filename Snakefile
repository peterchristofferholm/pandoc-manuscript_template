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
        cslfile = "references/evolution.csl"
    output: "manuscript.pdf"
    shell: """
        pandoc {input} -o {output} \
            -t latex --pdf-engine=xelatex \
            --filter=pandoc-manubot-cite \
            --csl={resources.cslfile} --citeproc
    """

rule docx_output:
    input: looks="looks/looks.docx",  text=sections
    resources:
        cslfile = "references/evolution.csl"
    output: "manuscript.docx"
    shell: """
        pandoc {input.text} -o {output} \
            -t docx --reference-doc={input.looks} \
            --filter=pandoc-manubot-cite \
            --csl={resources.cslfile} --citeproc
    """

rule html_output:
    input: looks="looks/looks.css",  text=sections
    resources:
        cslfile = "references/evolution.csl"
    output: "manuscript.html"
    shell: """
        pandoc {input.text} -o {output} \
            -t html --katex --css {input.looks} --standalone \
            --filter=pandoc-manubot-cite \
            --csl={resources.cslfile} --citeproc
    """
