# Dotfiles

Personal dotfiles with support for macOS, Arch Linux, Debian, and Red Hat based distributions.

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

### Customisation

For additional customisation, please use the `.private` file to store personal information, including your git credentials. A sample file called `.private.example` is included. Also note that files matching `*.private` are ignored by git (via `.gitignore`).

You can update `~/.wallpaper` to change the default wallpaper (for i3).

NB. The bootstrap script can be run multiple times, and should be run again after updates.


#### Points of interest

Custom dotfiles [**installer script**](https://github.com/blakejakopovic/dotfiles/blob/master/install) that supports multiple distributions, creating directories, and symlinking.

[**.zshrc config autoloading**](https://github.com/blakejakopovic/dotfiles/blob/master/.zshrc) that automatically loads configuration files based on distribution (or see [.bash_profile](https://github.com/blakejakopovic/dotfiles/blob/master/.bash_profile) version).

[**bash shell prompt**](https://github.com/blakejakopovic/dotfiles/blob/master/.bash_prompt) (with simple git)
```
blakejakopovic@BMBP ~/OSS/bitcoin (master *) $
```

[**zsh shell prompt**](https://github.com/blakejakopovic/dotfiles/blob/master/.zsh_prompt) (with detailed git)
```
[zsh] blakejakopovic@bcos ~/.dotfiles [master[+4]MM??] (1 stashed) ❯
```

[**.vimrc**](https://github.com/blakejakopovic/dotfiles/blob/master/.vimrc) custom config (using vim-plug automatic setup)

### License

Copyright (c) 2016 Blake Jakopovic. Licensed under the MIT license.
