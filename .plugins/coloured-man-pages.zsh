# Enable colored man pages
export LESS_TERMCAP_mb=$'\E[1;31m'      # begin blinking
export LESS_TERMCAP_md=$'\E[1;36m'      # begin bold
export LESS_TERMCAP_me=$'\E[0m'         # end mode
export LESS_TERMCAP_se=$'\E[0m'         # end standout-mode
export LESS_TERMCAP_so=$'\E[1;44;33m'   # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'         # end underline
export LESS_TERMCAP_us=$'\E[1;32m'      # begin underline

# Update man page colors
function update_man_colors {
    # Define variables
    local LESS_OPEN_DEFAULTS=$(echo $LESSOPEN)
    local MANPAGER_DEFAULTS=$(echo $MANPAGER)

    # Update LESSOPEN and MANPAGER environment variables
    export LESSOPEN="| /usr/bin/highlight -O xterm256 %s 2>/dev/null"
    export MANPAGER="/bin/sh -c \"col -b | /usr/bin/highlight -O xterm256 -l %n -c -s %N -t -X -i\""

    # Open man page with new colors
    man "$@" | less -R

    # Reset environment variables
    export LESSOPEN="$LESS_OPEN_DEFAULTS"
    export MANPAGER="$MANPAGER_DEFAULTS"
}
alias man="update_man_colors"

# Enable case-insensitive autocomplete
setopt nocaseglob

