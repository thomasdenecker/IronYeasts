# IronYeasts

[![Build Status](https://travis-ci.org/thomasdenecker/IronYeasts.svg?branch=master)](https://travis-ci.org/thomasdenecker/IronYeasts)
[![Coverage Status](https://coveralls.io/repos/github/thomasdenecker/IronYeasts/badge.svg?branch=master)](https://coveralls.io/github/thomasdenecker/IronYeasts?branch=master)

**IronYeasts** is a project that aims to find the genes involved in iron homeostasis in pathogenic yeasts. This project is divided into 2 main parts :
- formater.py : Database formating for R. This tool was implemented in Python 3 and is composed :
  - [GRYCotation](./docs/formater_gryc.md) : tool to get GRYC annotation of Yeast
  - [MESH_link](./docs/formater_mesh.md) : tool to find link between MESH terms
  - [GO_DEF](./docs/formater_go.md) : tool to get the last GO definition for each GO term.
- Ytools and Yanalysis : These programs was implemented with R :
  - Ytools : a package with various functions to assist in the analysis of multi-omics yeast data
  - Yanalysis : the code that performs the analysis using Ytools


## Requirements

### Python part

We use Pipenv to develop and run Python programs in IronYeast. We invite you to ensure you have
installed the following requirements before trying to use different programs:

* [pipenv](https://github.com/kennethreitz/pipenv)

We invite you to install pipenv to get all the necessary packages :

```bash
$ git clone https://github.com/thomasdenecker/IronYeasts.git
$ cd IronYeasts
$ pipenv install --ignore-pipfile
```

This project use [flake8](http://flake8.pycqa.org/en/latest/) to ensure coding style consistency (PEP8).
To test python codes locally, you can use this commande line:

```bash
$ pipenv run flake8 formater.py
```

## Quick start

Have you read the "Requirements" section above?

```bash
# Clone the project
$ git clone https://github.com/thomasdenecker/IronYeasts.git
$ cd IronYeasts
$ pipenv install --ignore-pipfile
```
Then, we invite you to read the different READMEs proposed for each options :
- [`--mesh`](./docs_github/formater_mesh.md) : To get link betweenn MESH Term
- [`--go`](./docs_github/formater_go.md) : To associate GO with its definition
- [`--gryc`](./docs_github/formater_gryc.md) : To get GRYC annotation for yeasts.

To have help for `formater.py`:

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

## Continuous integration
> Continuous Integration (CI) is the process of automating the build and testing of code at each commit changes.

In this project, we use [Travis CI](https://travis-ci.org). A documentation is available [here](./docs/TRAVIS_CI.md).

### Python part
#### 1) Lint the code
> `flake8` is tool to ensure coding style consistency (PEP8).

To run locally them with python codes

```bash
$ pipenv run flake8 formater.py
```
#### 2) Test code
> The pytest framework makes it easy to write small tests, yet scales to support complex functional testing for applications and libraries.

In coming

#### 3) Coveralls
> Coveralls is a web service to help you track your code coverage over time, and ensure that all your new code is fully covered.

A documentation is available [here](./docs/coveralls.md)

In coming

#### 4) Functional tests
We test for each change with a test file whether the output file is always the same.

```bash
diff file1.txt file2.txt
```

<aside class="warning">
You should never change test files (location and name)
</aside>

## Contributing

Please, see the [CONTRIBUTING](CONTRIBUTING.md) file.

## Contributor Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](http://contributor-covenant.org/). By participating in this project you
agree to abide by its terms. See [CODE_OF_CONDUCT](CODE_OF_CONDUCT.md) file.

## License

Pixel is released under the BSD-3 License. See the bundled [LICENSE](LICENSE)
file for details.
