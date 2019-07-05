# ~/.dotfiles/.bash_profile

# Add user bin folder to PATH
PATH="${HOME}/bin:${PATH}"
DOTFILESPATH="${HOME}/.dotfiles"

# Load OS specific dotfiles
declare -a os_dotfiles=("${DOTFILESPATH}")
[[ `uname -s` == "Darwin" ]] && os_dotfiles+=("${DOTFILESPATH}/osx")
[[ `uname -s` == "Linux"  ]] && os_dotfiles+=("${DOTFILESPATH}/linux")
[[ -f "/etc/arch-release" ]] && os_dotfiles+=("${DOTFILESPATH}/arch")
[[ -f "/etc/debian-version" ]] && os_dotfiles+=("${DOTFILESPATH}/debian")
[[ -f "/etc/redhat-release" ]] && os_dotfiles+=("${DOTFILESPATH}/redhat")

for base_path in ${os_dotfiles[@]}; do
  for file in ${base_path}/.{path,bash_path,exports,bash_exports,completion,bash_completion,aliases,bash_aliases,extras,bash_extras,extensions,bash_extensions,prompt,bash_prompt,private};
  do
      [ -r "${file}" ] && [ -f "${file}" ] && source "${file}";
  done;
  unset file
done

# added by Anaconda3 5.2.0 installer
export PATH="/Users/blakejakopovic/anaconda3/bin:$PATH"
