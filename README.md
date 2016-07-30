# Dotfiles

My OS X / Arch Linux dotfiles.

### Design Principles
* Simple homemade bootstrap script
* Supports multiple distributions
* Convention over configuration (using auto-loading)

### Installation
```
# Clone the repo locally
git clone https://github.com/blakejakopovic/dotfiles ~/.dotfiles

# Run bootstrap script
~/.dotfiles/install
```
For additional customisation, please use the `.private` file to store personal information, including git credentials. Note that you must also rename `.private.sample` to `.private` and that the `.private` file is not tracked by git.


NB. The bootstrap script can be run multiple times, and should be run again after updates.

### License

Copyright (c) 2016 Blake Jakopovic. Licensed under the MIT license.
