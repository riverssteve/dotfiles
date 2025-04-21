function gco
    fzf --height=20% --reverse --info=inline | xargs git checkout
end
