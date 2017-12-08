# ironYeast

A simple code to get link betweenn MESH Term.

## Requirements
* [pipenv](https://github.com/kennethreitz/pipenv)

## Quick start

```bash
# Clone the project
$ https://github.com/thomasdenecker/ironYeast.git
$ cd ironYeast/MESH_link
# Install pipenv
$ pipenv install
# Have help
python3 mesh_link.py --help
# Run GRYCotation with exemple files
$ pipenv run python mesh_link.py -m ./Mesh_file/d2018.bin -o ./Outputs/Mesh_link_table_2018
```
## Usage
```bash
Usage: MESH_link.py [options]

Options:
  -h, --help            show this help message and exit
  -m MESH, --MESH=MESH  Mesh file (bin format find here
                        (dYEAR.bin, ie. d2018.bin):
                        ftp://nlmpubs.nlm.nih.gov/online/mesh/MESH_FILES/
                        asciimesh/)
  -o OUTPUT, --output=OUTPUT
                        File name of link table (whithout format (.txt))
```
## MESH

The MESH or Medical Subject Headings is the thesaurus of the National Library of Medicine's controlled vocabulary. It consists of sets of terms naming descriptors in a hierarchical structure allowing search at different levels of specificity (https://meshb.nlm.nih.gov/search). It is possible to download all the MESHs. An important point of the MESH term is that other MESH terms are recommended for reading. This code generate a link table between a MESH term and MESH terms associated.  
