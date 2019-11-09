#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#    exec startx -- -keeptty > ~/.xorg.log 2>&1
    exec startx 
fi
