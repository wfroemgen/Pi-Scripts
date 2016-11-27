# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# Alias
alias luks+='sudo cryptsetup luksOpen /dev/sda HDD ;sudo  mount /dev/mapper/HDD /media/HDD '
alias luks-='sudo umount -l /media/HDD ; sudo cryptsetup luksClose HDD '

alias status='uptime ; echo ; echo "=STATUS="; echo "-CPU-" ; vcgencmd measure_temp | cut -b 6- ; vcgencmd measure_volts | cut -b 6- ; vcgencmd measure_clock arm | cut -b 15- ; echo "-HDD-" ; sudo smartctl -A /dev/sda | grep Temperature_Cels | cut -b 88-90 ; echo ;  echo "=SPEICHER="; df -h / /dev/mapper/HDD ; echo ; du -sh /home/pi/LOG /media/HDD/Pi-Bak /media/HDD/Synology-Bak.hbk 2>/dev/null; echo ; echo "=VPN="; tail /home/pi/fritzboxvpn.log ; echo ; echo "=SSH=";  tail -n25 /home/pi/ssh.log '
alias status-watch='watch "uptime ; echo ; echo "=STATUS="; echo "-CPU-" ; vcgencmd measure_temp | cut -b 6- ; vcgencmd measure_volts | cut -b 6- ; vcgencmd measure_clock arm | cut -b 15- ; echo "-HDD-" ; sudo smartctl -A /dev/sda | grep Temperature_Cels | cut -b 88-90 ; echo ;  echo "=SPEICHER="; df -h / /dev/mapper/HDD ; echo ; du -sh /home/pi/LOG /media/HDD/Pi-Bak /media/HDD/Synology-Bak.hbk 2>/dev/null; echo ; echo "=VPN="; tail -n3 /home/pi/fritzboxvpn.log ; echo ; echo "=SSH=";  tail -n25 /home/pi/ssh.log" '
