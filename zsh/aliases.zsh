# Assumes ls here is gnuls (on MacOS this requires coreutils to be installed)
alias ls='ls --hyperlink --color'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias pping='prettyping --nolegend'
alias vi='vim'
alias ssh="TERM=xterm-256color ssh"

unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && zshz "$*" && return
  cd "$(zshz -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')" || exit
}

if [[ -f $HOME/.local/share/work/aliases.zsh ]]; then
    . $HOME/.local/share/work/aliases.zsh
fi
