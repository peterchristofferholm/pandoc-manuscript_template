# pandoc-manuscript-example

Example of how to create a reasonably complex document (e.g. a manuscript) using Markdown and Pandoc.

`make all` will remake the output files (manuscript.pdf, manuscript.html, manuscript.docx).


## Notes

1. The look of each document is specified by an appropriate file in the `./looks` folder: `looks.yaml` controls fonts and margins of the PDF output; `looks.docx` specifies formatting of headers and fonts for the Word output; `looks.css` specifies the look and feel of the HTML output.

2. To change how citations are formatted, you can download alternate Citation Style Language (CSL) files from the [Zotero Style Repository](https://www.zotero.org/styles)

3. I've provided a makefile for producing output in different formats. `make` is provided by default in pretty much all unix-like sytems (Linux, MacOS). To install make on a Windows system see the instructions [here](https://stackoverflow.com/a/54086635/2161232)

    If you want to learn more about make and makefiles, here are some useful links:

    - [Gnu Make Manual](https://www.gnu.org/software/make/manual/)
    - [Karl Broman: Minimal Make](https://kbroman.org/minimal_make/)
    - [Notes for New Make Users](http://gromnitsky.users.sourceforge.net/articles/notes-for-new-make-users/)
    - [Software Carpentry: Automation and Make](https://swcarpentry.github.io/make-novice/)