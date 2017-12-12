# ironYeast

Simple code to associate GO with its definition.

## Requirements
* [pipenv](https://github.com/kennethreitz/pipenv)

## Quick start

```bash
# Clone the project
$ https://github.com/thomasdenecker/ironYeast.git
$ cd ironYeast/GO_DEF
# Install pipenv
$ pipenv install
# Have help
python3 go_obo_to_table.py --help
# Run go_obo_to_table by default
$ pipenv run python go_obo_to_table.py
```
## Usage
```bash
usage: go_obo_to_table.py [-h] [-g GO_FILE] [-o OUTPUT]

optional arguments:
  -h, --help            show this help message and exit
  -g GO_FILE, --GO GO_FILE
                        GO terms file (obo format find here : (go.obo, ie.
                        go.obo : http://purl.obolibrary.org/obo/go.obo). By
                        default, the last version
  -o OUTPUT, --output OUTPUT
                        File name of link table (whithout format (.txt)). By
                        default : GO_with_def_DATE.txt
```
## GO

> Gene ontology (GO) is a major bioinformatics initiative to unify the representation of gene and gene product attributes across all species. More specifically, the project aims to:
> 1) maintain and develop its controlled vocabulary of gene and gene product attributes;
> 2) annotate genes and gene products, and assimilate and disseminate annotation data; and
> 3) provide tools for easy access to all aspects of the data provided by the project, and to enable functional interpretation of experimental data using the GO, for example via enrichment analysis.
>
> GO is part of a larger classification effort, the Open Biomedical Ontologies (OBO).
>
> -- <cite>Wikipédia</cite>
