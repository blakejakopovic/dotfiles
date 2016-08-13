# ~/.dotfiles/.bash_profile

# Add user bin folder to PATH
PATH=$HOME/bin:$PATH
DOTFILESPATH=$HOME/.dotfiles

# Load generic shell dotfiles
for file in $DOTFILESPATH/.{path,exports,completion,aliases,extras,prompt,extensions,private};
do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file

# Load bash shell dotfiles
for file in $DOTFILESPATH/.{bash_path,exports,bash_exports,bash_completion,aliases,bash_aliases,bash_extras,bash_extensions,bash_prompt}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file

# Load OS specific dotfiles
if [[ `uname -s` == "Darwin" ]]; then
  OS_DOTFILES="osx"
elif [[ `uname -s` == "Linux" ]]; then
  OS_DOTFILES="linux"
fi

if [ $OS_DOTFILES ]; then
  for file in $DOTFILESPATH/$OS_DOTFILES/.{bash_path,exports,bash_exports,bash_completion,aliases,bash_aliases,bash_extras,bash_extensions,bash_prompt,private}; do
      [ -r "$file" ] && [ -f "$file" ] && source "$file";
  done;
  unset file
fi
