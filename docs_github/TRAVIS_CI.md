# Travis CI

This documentation contains notes about how we proceed to integrate and
configure Travis CI for the IronYeasts project. **Once configured, those steps don't
have to be reproduced.**

## Integration steps

1. Login to [travis-ci.org](https://travis-ci.org/) with your github account to
   ease github integration. Accept the GitHub access permissions confirmation.
2. Once you’re signed in to Travis CI, and Travis CI have synchronized your GitHub
repositories, go to your profile page and enable the repository you want to build
(Pushbutton to check (green))
3. Add a `.travis.yml` file to your repository to tell Travis CI what to do.
4. Add the `.travis.yml` file to git, commit and push, to trigger a Travis CI build.
Travis only runs builds on the commits you push after you’ve enabled the repository in Travis CI.
5. Check the build status page to see if your build passes or fails, according to the return status of the build command

## Configuration (`.travis.yml`)

### IronsYeasts : Python part

Documentation in [Travis CI](https://docs.travis-ci.com/user/languages/python/)

#### Language selection

```
language: python
```
#### Version selection

```
python:
  - "3.6"
```
#### Module installation

```
- pip3 install pylint
- ...
```

#### Script to run

```
- pylint script.py
- ...
```

#### Final Content
```
language: python
python:
  - "3.6"

install:
  - pip install pylint

script:
  - pylint script.py
```
### IronsYeasts : R part

Documentation in [Travis CI](https://docs.travis-ci.com/user/languages/r/)

To be continued...
