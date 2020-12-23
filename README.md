# pandoc-manuscript

Example of how to create a reasonably complex document (e.g. a manuscript) using Markdown and Pandoc. 
`Snakemake` will remake all the output files (manuscript.pdf, manuscript.html,
manuscript.docx).

## Requirements

* pandoc
* python3 (+ snakemake, manubot)
    * `pip install snakemake` 
    * `pip install manubot` 

## Notes

1. The look of each document is specified by an appropriate file in the `./looks` folder: `looks.yaml` controls fonts and margins of the PDF output; `looks.docx` specifies formatting of headers and fonts for the Word output; `looks.css` specifies the look and feel of the HTML output.

2. To change how citations are formatted, you can download alternate Citation Style Language (CSL) files from the [Zotero Style Repository](https://www.zotero.org/styles)

3. I've provided a Snakefile for producing output in different formats.
