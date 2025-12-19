export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(git)

source $ZSH/oh-my-zsh.sh

PROMPT="%F{cyan}%n@%F{green}%m%f:%F{yellow}%~%f $ > "
RPROMPT=""

# Use vim
export EDITOR=vim
export VISUAL=vim
bindkey -v

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Start tmux automatically if not already inside tmux
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach-session -t default || tmux new-session -s default
fi

# Wi-Fi connect function
wifi-connect() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: wifi-connect <SSID> <PASSWORD>"
        return 1
    fi
    local SSID="$1"
    local PASSWORD="$2"
    nmcli device wifi connect "$SSID" password "$PASSWORD"
}



open() { 
    local target="${1:-.}" 
    (nohup xdg-open "$target" >/dev/null 2>&1 &) 
}

