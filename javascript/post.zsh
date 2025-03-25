autoload -U add-zsh-hook
load-nvmrc() {
    export NVM_DIR="$HOME/.nvm"
    [[ -a .nvmrc ]] && {
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

        local nvmrc_path=".nvmrc"

        if [ -n "$nvmrc_path" ]; then
            local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
            echo $nvmrc_node_version

            if [ "$nvmrc_node_version" = "N/A" ]; then
            nvm install
            elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
            nvm use
            fi
        elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
            echo "Reverting to nvm default version"
            nvm use default
        fi
    }
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
