if status is-interactive
    if command -v atuin >/dev/null
        atuin init fish | source
    end

    # Set up prompt
    if command -v starship >/dev/null
        starship init fish | source
    end

    # https://mise.jdx.dev/
    if command -v mise >/dev/null
        mise activate fish | source
    end

    # https://docs.astral.sh/uv/getting-started/installation/#shell-autocompletion
    if command -v uv >/dev/null
        uv generate-shell-completion fish | source
    end
end

# Set up path
fish_add_path /Users/steve.rivers/.cargo/bin
fish_add_path /Users/steve.rivers/.pyenv/shims
fish_add_path /opt/homebrew/opt/coreutils/libexec/gnubin
fish_add_path /Users/steve.rivers/.dotfiles/bin
fish_add_path /opt/homebrew/bin
fish_add_path /Users/steve.rivers/.local/bin
fish_add_path /opt/homebrew/binutils/bin
fish_add_path /opt/homebrew/opt/fzf/bin

# Environment variables

# shortcut to this dotfiles path is $DOTFILES
set -Ux DOTFILES "$HOME/.dotfiles"

# project folder that we can `c [tab]` to
set -Ux PROJECTS "$HOME/code"

# Set editor defaults
set -gx EDITOR nvim
set -gx VEDITOR pycharm

# Source secrets and extras
if test -f $HOME/.config/fish/secrets.fish
    source $HOME/.config/fish/secrets.fish
end

if test -f $HOME/.config/fish/extras.fish
    source $HOME/.config/fish/extras.fish
end

# Set custom greeting
set -U fish_greeting ""

# Set up FZF theme
set -gx FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS \
    --highlight-line \
    --info=inline-right \
    --ansi \
    --layout=reverse \
    --border=none \
    --color=bg+:#283457 \
    --color=bg:#16161e \
    --color=border:#27a1b9 \
    --color=fg:#c0caf5 \
    --color=gutter:#16161e \
    --color=header:#ff9e64 \
    --color=hl+:#2ac3de \
    --color=hl:#2ac3de \
    --color=info:#545c7e \
    --color=marker:#ff007c \
    --color=pointer:#ff007c \
    --color=prompt:#2ac3de \
    --color=query:#c0caf5:regular \
    --color=scrollbar:#27a1b9 \
    --color=separator:#ff9e64 \
    --color=spinner:#ff007c

# Set custom greeting
set -U fish_greeting ""
