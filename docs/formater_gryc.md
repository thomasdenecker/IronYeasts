# GRYCotation

A simple code to get GRYC annotation for yeasts.

## Requirements
* [pipenv](https://github.com/kennethreitz/pipenv)

## Quick start

```bash
# Clone the project
$ git clone https://github.com/thomasdenecker/Tools.git
$ cd Tools/GRYC
# Install pipenv
$ pipenv install
# Have help
python GRYCotation.py --help
# Run GRYCotation with exemple files
$ pipenv run python grycotation.py -o C_glabrata -f ./C_glabrata_EMBL/
```
## Usage
```bash
Usage: grycotation.py [options]

Options:
  -h, --help            show this help message and exit
  -o ORGANISM, --organism=ORGANISM
                        Studied organism
  -f FOLDER, --folder=FOLDER
                        Folder with EMBL files
```
## GRYC and EMBL files

This code was made to recover the names of genes and associated notes present in EMBL files available on [GRYC](http://gryc.inra.fr/index.php?page=home). For each yeast, it is possible to download a tar. gz folder with an EMBL file for each chromosome. This code works with this unzipped file. The proposed test folder (C_glabrata_EMBL) has been downloaded here: [Candida glabrata CBS_138](http://gryc.inra.fr/index.php?page=download)
