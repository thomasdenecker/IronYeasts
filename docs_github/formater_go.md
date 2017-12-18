# Formater `--go`

Simple code to associate GO with its definition.

## Requirements
* [pipenv](https://github.com/kennethreitz/pipenv)

## Quick start

```bash
# Clone the project
$ git clone https://github.com/thomasdenecker/IronYeasts.git
$ cd IronYeasts
# Install pipenv
$ pipenv install --ignore-pipfile
# Have help
python3 formater.py --help
# Run go_obo_to_table by default
$ pipenv run python formater.py --go -i tests/GO/GO_input_test.obo -o ./Outputs/demo_GO
```
## Usage
```bash
$ python formater.py --help
usage: formater.py [-h] [-i INPUT] [-o OUTPUT] [--mesh] [--go] [--gryc]

optional arguments:
  -h, --help            show this help message and exit
  -i INPUT, --input INPUT
                        For MESH, a Mesh file (bin format find here
                        (dYEAR.bin, ie. d2018.bin):
                        ftp://nlmpubs.nlm.nih.gov/online/mesh/MESH_FILES/
                        asciimesh/). For GO, a GO terms file (obo format find
                        here : (go.obo, ie. go.obo :
                        http://purl.obolibrary.org/obo/go.obo). By default,
                        the last version.For GRYC a folder with EMBL files
  -o OUTPUT, --output OUTPUT
                        Output file name (whithout format (.txt))
  --mesh                Converte raw mesh file to link table
  --go                  Associate GO term and its definition
  --gryc                Generate table with all annotations of GRYC
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
