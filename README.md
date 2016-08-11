# Dotfiles

My OS X / Arch Linux dotfiles.

### Design Principles
* Simple homemade bootstrap script
* Support for multiple distributions
* Convention over configuration (with auto-loading)

### Installation
```zsh
# Clone the repo locally
git clone https://github.com/blakejakopovic/dotfiles ~/.dotfiles

# Run bootstrap script
~/.dotfiles/install
```
For additional customisation, please use the `.private` file to store personal information, including your git credentials. A sample file called `.private.example` is included. Also note that files matching `*.private` are ignored by git.

NB. The bootstrap script can be run multiple times, and should be run again after updates.

### License

Copyright (c) 2016 Blake Jakopovic. Licensed under the MIT license.
