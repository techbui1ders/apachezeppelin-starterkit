# Apache Zeppelin Starter-kit

Terminal scripts for Ubuntu to accelerate the install and configuration of Apache Zeppelin in a single-node environment. The latest is 0.7.3

## Table of Contents

- [Initial Install](#Initial-Install)
- [Usage](#usage)
- [Authentication & Authorization](#Apache-Shiro-Authentication-&-Authorization-configuration)
- [Support](#support)
- [Contributing](#contributing)

## Initial Install

Start with a fresh install of Ubuntu Desktop or Server. These scripts were tested on Ubuntu 16.04.02 and may work on other versions. All code is meant to be run from the terminal.

For the installer run the following as root:

```sh
wget https://raw.githubusercontent.com/techbui1ders/apachezeppelin-starterkit/master/latest/install-zeppelin.sh
chmod +x install-zeppelin.sh
sudo yes | ./install-zeppelin.sh
```

## Usage

When the install-zeppelin.sh script completes, navigate to the URL shown in the terminal to use the latest Apache Zeppelin.

The URL should be http://<local ip address of machine>:8080/

## Apache Shiro Authentication & Authorization configuration

TBD

## Support

Please [open an issue](https://github.com/balexbyrd/zeppelin-starterkit/issues/new) for support.

## Contributing

Please contribute using [Github Flow](https://guides.github.com/introduction/flow/). Create a branch, add commits, and [open a pull request](https://github.com/fraction/readme-boilerplate/compare/).
