# ~/.osx/.bash_aliases

# Use GNU rm and mv commands (with root safety)
alias rm='grm --preserve-root -v -i'
alias rmf='grm -rf'
alias mv='mv -i -v'

# Directory
alias l="gls --color=auto"
alias lsx="gls --color=auto"
alias ll="gls= --color=auto -al"

# Perserve Root
alias chown='gchown --preserve-root'
alias chmod='gchmod --preserve-root'
alias chgrp='gchgrp --preserve-root'

# Finder
show-hidden-files() {
  defaults write com.apple.finder AppleShowAllFiles TRUE
  killall Finder
}

hide-hidden-files() {
  defaults write com.apple.finder AppleShowAllFiles FALSE
  killall Finder
}

# Homebrew
alias bu='brew update'
alias bup='brew upgrade --all'
alias bo='brew outdated'

# DNS
alias flush-dns='dscacheutil -flushcache'

# Disk Images
iso2img() { # INPUT OUTPUT
  filename=$(basename "$1")
  extension="${filename##*.}"
  filename="${filename%.*}"
  output="$filename.img"
  hdiutil convert -format UDRW -o "$output" $1
}

# Devices
alias lsusb='system_profiler SPUSBDataType' # SIMULATED, NOT LINUX VERSION

# MAC Spoof
wifi-mac() {
  current_mac=`wifi-mac2`
  if [ "$current_mac" = "6c:40:08:93:2b:50" ]; then
    echo "$current_mac (DEFAULT)"
  else
    echo "$current_mac (SPOOF)"
  fi
}

wifi-mac2() {
  ifconfig en0 | head -n2 | tail -n1 | cut -d " " -f 2
}

spoof-wifi() {
  mac=`genmac-apple`
  sudo spoof-mac set $mac Wi-Fi
  echo "New MAC: $mac"
  networksetup -setairportpower Wi-Fi off > /dev/null
  sleep 8
  networksetup -setairportpower Wi-Fi on > /dev/null
}

spoof-wifi-reset() {
  sudo spoof-mac reset Wi-Fi
  echo "MAC: $(wifi-mac2)"
  networksetup -setairportpower Wi-Fi off > /dev/null
  sleep 8
  networksetup -setairportpower Wi-Fi on > /dev/null
}

# DNS Crypt
dnscrypt-wifi-enable() {
  sudo /bin/bash -c "networksetup -getdnsservers Wi-Fi > /etc/dnscrypt-wifi.restore"
  sudo networksetup -setdnsservers Wi-Fi 127.0.0.1
  echo "New DNS: 127.0.0.1"
}

dnscrypt-wifi-disable() {
  restore_servers=$(sudo bash -c "cat /etc/dnscrypt-wifi.restore | xargs")
  sudo  networksetup -setdnsservers Wi-Fi $restore_servers
  echo "New DNS: $restore_servers"
}

dnscrypt-wifi-reset() {
  sudo networksetup -setdnsservers Wi-Fi empty
  echo "DNS servers reset"
}

# WiFi
wifi-on() {
  networksetup -setairportpower Wi-Fi on > /dev/null
}

wifi-off() {
  networksetup -setairportpower Wi-Fi off > /dev/null
}
