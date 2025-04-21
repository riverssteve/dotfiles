# Only load pyenv-virtualenv if there is a .python-version in the current
# directory. This nerfs workon but speeds shell up.

autoload -U add-zsh-hook
load-pyenv() {
    [[ $(basename $(pwd)) == "kraken-core" ]] && [[ -a ".python-version" ]] && {
        echo "setting up pyenv-virualenvwrapper"
        # Set up pyenv-virtualenvwrapper
        pyenv virtualenvwrapper
    }
}
add-zsh-hook chpwd load-pyenv
load-pyenv
