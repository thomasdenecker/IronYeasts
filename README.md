# IronYeasts

[![Build Status](https://travis-ci.org/thomasdenecker/IronYeasts.svg?branch=master)](https://travis-ci.org/thomasdenecker/IronYeasts)
[![Coverage Status](https://coveralls.io/repos/github/thomasdenecker/IronYeasts/badge.svg?branch=master)](https://coveralls.io/github/thomasdenecker/IronYeasts?branch=master)

## Requirements

We use Pipenv to develop and run Python programs in IronYeast. We invite you to ensure you have
installed the following requirements before trying to use different programs:

* [pipenv](https://github.com/kennethreitz/pipenv)

This project use `flake8` to ensure coding style consistency (PEP8). To test python codes locally,
you must install the following modules:

* [flake8](http://flake8.pycqa.org/en/latest/)
* [Pylint](https://www.pylint.org/#install)

The command lines to install them are :

```bash
python3 -m pip install flake8
python3 -m pip install pylint
```

## Quick start

Have you read the "Requirements" section above?

```bash
# Clone the project
$ git clone https://github.com/thomasdenecker/IronYeasts.git
$ cd IronYeasts
```
Then, we invite you to read the different READMEs proposed for each program.

## Lint the code

This project use `flake8` and `lint` to ensure coding style consistency (PEP8).
To run them with python codes

```bash
$ flake8 CODE_NAME.py
$ pylint CODE_NAME.py
```

## Contributing

Please, see the [CONTRIBUTING](CONTRIBUTING.md) file.

## Contributor Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](http://contributor-covenant.org/). By participating in this project you
agree to abide by its terms. See [CODE_OF_CONDUCT](CODE_OF_CONDUCT.md) file.

## License

Pixel is released under the BSD-3 License. See the bundled [LICENSE](LICENSE)
file for details.
