# Dotfiles

Personal dotfiles with support for macOS, Arch Linux, Debian, and Red Hat based distributions.

#### Design Principles
* Simple homemade bootstrap script
* Support for multiple distributions
* Convention over configuration (with autoloading)

#### Installation
```zsh
# Clone the repo locally
git clone https://github.com/blakejakopovic/dotfiles ~/.dotfiles

# Run bootstrap script
~/.dotfiles/install
```

#### Customisation

For additional customisation, please use the `.private` file to store personal information, including your git credentials. A sample file called `.private.example` is included. Also note that files matching `*.private` are ignored by git (via `.gitignore`).

You can update `~/.wallpaper` to change the default wallpaper (for i3).

NB. The bootstrap script can be run multiple times, and should be run again after updates.


#### Points of interest

[**dotfiles installer script**](https://github.com/blakejakopovic/dotfiles/blob/master/install) that supports multiple distributions, creating directories, and symlinks.

```
# Example directory and symlink creation
r_dir .ssh
r_symlink .zshrc
...

# Install operating system specific dotfiles
declare -a os_dotfiles
[[ `uname -s` == "Darwin" ]] && os_dotfiles+=("${DOTFILESPATH}/osx/install")
[[ `uname -s` == "Linux"  ]] && os_dotfiles+=("${DOTFILESPATH}/linux/install")
[[ -f "/etc/arch-release" ]] && os_dotfiles+=("${DOTFILESPATH}/arch/install")
[[ -f "/etc/debian-version" ]] && os_dotfiles+=("${DOTFILESPATH}/debian/install")
[[ -f "/etc/redhat-release" ]] && os_dotfiles+=("${DOTFILESPATH}/redhat/install")

for installer in ${os_dotfiles[@]}; do
  [ -r "${installer}" ] && [ -f "${installer}" ] && source "${installer}"
done
```

[**.zshrc config autoloading**](https://github.com/blakejakopovic/dotfiles/blob/master/.zshrc) which loads configuration files based on distribution (or see [.bash_profile](https://github.com/blakejakopovic/dotfiles/blob/master/.bash_profile) version).

```zsh
for base_path in ${os_dotfiles[@]}; do
  for file in ${base_path}/.{path,zsh_path,exports,zsh_exports,completion,zsh_completion,aliases,zsh_aliases,extras,zsh_extras,extensions,zsh_extensions,prompt,zsh_prompt,private};
  do
      [ -r "${file}" ] && [ -f "${file}" ] && source "${file}";
  done;
  unset file
done
```


[**bash shell prompt**](https://github.com/blakejakopovic/dotfiles/blob/master/.bash_prompt) (with simple git)
```
blakejakopovic@BMBP ~/OSS/bitcoin (master *) $
```

[**zsh shell prompt**](https://github.com/blakejakopovic/dotfiles/blob/master/.zsh_prompt) (with detailed git)
```
[zsh] blakejakopovic@bcos ~/.dotfiles [master[+4]MM??] (1 stashed) ❯
```

![zsh Screenshot](https://github.com/blakejakopovic/dotfiles/raw/e2ee46cee945a3699fdd7e306ab0a73488cc803d/data/screenshot.png)

#### License

Copyright (c) 2016 Blake Jakopovic. Licensed under the MIT license.
