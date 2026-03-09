# ohmyzsh config
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git docker docker-compose rust python tmux )

source $ZSH/oh-my-zsh.sh

# Manjaro-specific zsh config
if [[ "$(uname)" == "Linux" ]]; then
  if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
    source /usr/share/zsh/manjaro-zsh-config
  fi
  if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
    source /usr/share/zsh/manjaro-zsh-prompt
  fi
fi

alias emacs_d="emacs --daemon"
alias emacs_c="emacsclient -t"

# Sometimes git malfunctions occsaionally, do this
alias ssh_add="ssh-add ~/.ssh/key"

alias vi="nvim"

# Go
export PATH="$PATH:$HOME/go/bin"

# Node stuff
export NODE_OPTIONS=--openssl-legacy-provider

# Android SDK
if [[ "$(uname)" == "Darwin" ]]; then
  export ANDROID_HOME="$HOME/Library/Android/sdk"
else
  export ANDROID_HOME="$HOME/Android/Sdk"
fi
export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator"

# Konsole opens tabs in current directory, that shits annoying
if [[ "$(uname)" == "Linux" ]]; then
  cd $HOME
fi
# ===============
# Lazygit 
# ===============
alias lzg="lazygit"

# ===============
# Tmux
# ===============
alias ts="tmux new-session -s"
alias tl="tmux list-sessions"
alias ta="tmux attach -t"

# ===============
# LazyDocker
# ===============
alias lzd="lazydocker"

# ===============
# Podman (Linux only)
# ===============
if [[ "$(uname)" == "Linux" ]]; then
  export DOCKER_HOST="unix:///run/user/$(id -u)/podman/podman.sock"

  alias pms="systemctl --user start podman.socket && echo 'Podman socket started'"
  alias pmd="podman-compose down"

  # podman compose build & up -d, optionally specify service names
  pcbu() {
    if [[ $# -eq 0 ]]; then
      podman-compose up --build -d
    else
      podman-compose up --build -d "$@"
    fi
  }

  # tab completion: list services from compose file in current directory
  _pcbu() {
    local compose_file
    for f in docker-compose.yml docker-compose.yaml compose.yml compose.yaml; do
      [[ -f "$f" ]] && compose_file="$f" && break
    done
    [[ -z "$compose_file" ]] && return
    local services
    services=($(grep -E '^  [a-zA-Z0-9_-]+:' "$compose_file" | sed 's/://;s/^ *//'))
    compadd -a services
  }
  compdef _pcbu pcbu
fi
