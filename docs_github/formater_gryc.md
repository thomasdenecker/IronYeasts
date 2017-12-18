# Formater `--gryc`

A simple code to get GRYC annotation for yeasts.

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
python formater.py --help
# Run GRYCotation with exemple files
$ pipenv run python formater.py --gryc -i ./tests/GRYC/ -o ./Outputs/demo_GRYC
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
## GRYC and EMBL files

This code was made to recover the names of genes and associated notes present in EMBL files available on [GRYC](http://gryc.inra.fr/index.php?page=home). For each yeast, it is possible to download a tar. gz folder with an EMBL file for each chromosome. This code works with this unzipped file. The proposed test folder (C_glabrata_EMBL) has been downloaded here: [Candida glabrata CBS_138](http://gryc.inra.fr/index.php?page=download)
