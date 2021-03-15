# mac osx

## OS X

- MacPorts
- vs code
- sublime text 3
- <https://github.com/geerlingguy/mac-dev-playbook>
- <https://github.com/geerlingguy/pi-dev-playbook>

### MacPorts

- installation
- ports to install
  - python38
  - openssl
  - pip_select
  - py38-pip
  - py38-setuptools
  - python3_select
  - python38
  - python_select

```sh
$ sudo port install go python38 neovim tree

TODO output goes here
...

$ sudo port python_select ...

TODO output goes here
```

- create development filesystem

```sh
$ mkdir -p go/src/github.com/joshuaejs go/pkg go/bin joshuaejs

TODO output goes here
```



- pip install
  - flake8
  - jinja2
  - jupyter
  - mypy
  - pydocstyle
  - pylint
  - bandit

```sh
$ sudo -H pip install flake8 jinja2 jupyter mypy ...

TODO output goes here
```

### Docker

- docs
  - (<https://docs.docker.com/docker-for-mac/>)

### vs code

- install extensions
  - Settings Sync
    - login to GitHub
    - initiate download
  - Python
  - Go
