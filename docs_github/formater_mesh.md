# Formater `--mesh`

A simple code to get link betweenn MESH Term.

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
# Run mesh_link with exemple files
$ pipenv run python formater.py --mesh -i tests/MESH/MESH_input_test.bin -o ./Outputs/demo_MESH

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
## MESH

The MESH or Medical Subject Headings is the thesaurus of the National Library of Medicine's controlled vocabulary. It consists of sets of terms naming descriptors in a hierarchical structure allowing search at different levels of specificity (https://meshb.nlm.nih.gov/search). It is possible to download all the MESHs. An important point of the MESH term is that other MESH terms are recommended for reading. This code generate a link table between a MESH term and MESH terms associated.  
