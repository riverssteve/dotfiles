# Setup fzf {{{
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
    export PATH="${PATH:+${PATH}:}$(brew --prefix)/opt/fzf/bin"
fi
#}}}
# Colors {{{
# https://github.com/catppuccin/fzf
_fg="#c6d0f5"
_bg="#303446"
_hl="#e78284"
_fgp="#c6d0f5"
_bgp="#414559"
_hlp="#e78284"
_pointer="#f2d5cf"
_info="#ca9ee6"
_spinner="#f2d5cf"
_header="#e78284"
_prompt="#ca9ee6"
_marker="#f2d5cf"
# }}}
# Auto-completion {{{
[[ $- == *i* ]] && source "$(brew --prefix)/opt/fzf/shell/completion.zsh" 2> /dev/null
#}}}
# Key bindings {{{
[ -f "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh" ] && source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
#}}}

export FZF_DEFAULT_OPTS="
    --color fg+:$_fgp,bg+:$_bgp,hl+:$_hlp
    --color pointer:$_pointer,info:$_info,spinner:$_spinner,header:$_header,prompt:$_prompt,marker:$_marker
"
