export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

PROMPT='%1~ $ '

export LDFLAGS="-L/opt/homebrew/opt/python@3.8/lib"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

alias k=kubectl
alias kpf='kubectl port-forward'
alias kn="kubectl get nodes -o custom-columns=\"NAME:.metadata.name,STATUS:status.conditions[?(@.status=='True')].type,ARCH:.status.nodeInfo.architecture,LIFECYCLE:.metadata.labels.lifecycle,CPU:.status.capacity.cpu,RAM:.status.capacity.memory\""
alias d=docker
alias kk=kubectx
alias kr=kubectl rollout restart

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/homebrew/bin:$PATH"
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
