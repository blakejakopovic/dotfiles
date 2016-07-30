# ~/.dotfiles/.zshrc

# Add user bin folder to PATH
PATH=$HOME/bin:$PATH
DOTFILESPATH=$HOME/.dotfiles

# Load generic shell dotfiles
for file in $DOTFILESPATH/.{path,exports,completion,aliases,extras,prompt,extensions,private};
do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file

# Load zsh shell dotfiles
for file in $DOTFILESPATH/.{zsh_path,exports,zsh_exports,zsh_completion,aliases,zsh_aliases,zsh_extras,zsh_prompt,zsh_extensions};
do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file

# Load OS specific dotfiles
if [[ `uname -s` == "Darwin" ]]; then
  OS_DOTFILES="osx"
elif [[ -f "/etc/arch-release" ]]; then
  OS_DOTFILES="arch"
fi

if [ $OS_DOTFILES ]; then
  for file in $DOTFILESPATH/$OS_DOTFILES/.{zsh_path,zsh_completion,exports,zsh_exports,aliases,zsh_aliases,zsh_extras,zsh_prompt,zsh_extensions,private}; 
  do
      [ -r "$file" ] && [ -f "$file" ] && source "$file";
  done;
  unset file
fi
