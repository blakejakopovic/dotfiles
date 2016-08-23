# ~/.dotfiles/.zshrc

# Add user bin folder to PATH
PATH="${HOME}/bin:${PATH}"
DOTFILESPATH="${HOME}/.dotfiles"

# Load OS specific dotfiles
declare -a os_dotfiles=("${DOTFILESPATH}")
[[ `uname -s` == "Darwin" ]] && os_dotfiles+=("${DOTFILESPATH}/osx")
[[ `uname -s` == "Linux"  ]] && os_dotfiles+=("${DOTFILESPATH}/linux")
[[ -f "/etc/arch-release" ]] && os_dotfiles+=("${DOTFILESPATH}/arch")
[[ -f "/etc/debian-version" ]] && os_dotfiles+=("${DOTFILES_DIR}/debian")
[[ -f "/etc/redhat-release" ]] && os_dotfiles+=("${DOTFILES_DIR}/redhat")

for base_path in ${os_dotfiles[@]}; do
  for file in ${base_path}/.{path,zsh_path,exports,zsh_exports,completion,zsh_completion,aliases,zsh_aliases,extras,zsh_extras,extensions,zsh_extensions,prompt,zsh_prompt,private};
  do
      [ -r "${file}" ] && [ -f "${file}" ] && source "${file}";
  done;
  unset file
done
