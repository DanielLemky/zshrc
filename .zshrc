# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set a clean base PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Add Homebrew (for op and other tools)
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# Add rbenv
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init - zsh)"

# Add custom paths
export PATH="/Applications/Ghostty.app/Contents/MacOS:$PATH"
export PATH="$HOME/.orbstack/bin:$PATH"

# powerlevel10k
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zoxide
eval "$(zoxide init zsh)"

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=10000
HISTSIZE=10000
setopt appendhistory
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# fzf (fuzzy find)
source <(fzf --zsh)

# alias
alias .="nvim ."
alias gcm="git checkout main"
alias gs="git status"
alias lg="lazygit"
alias lsa="ls -a"
alias neovim="cd ~/.config/nvim/"
alias zsh="nvim ~/.zshrc"
alias zj="zellij"
alias rc="rails console"
alias rcss="rails tailwindcss:watch"
alias rdbm="rails db:migrate"
alias rdbr="rails db:rollback"
alias rs="rails server"
alias rt="rails test"

# projects
alias engage="cd ~/Development/local/engagespot/"
alias engagemarketing="cd ~/Development/local/engagespotmarketing/"
alias kipos="cd ~/Development/local/kipos-2/"
alias joyfountain="cd ~/Development/local/joyfountain/"

alias tea='curl -s https://home.hq:3000/api/tea_pots | jq -r '\''"\(.heading) \(.message)"'\'
alias kamal='docker run -it --rm -v "${PWD}:/workdir" -v "/run/host-services/ssh-auth.sock:/run/host-services/ssh-auth.sock" -e SSH_AUTH_SOCK="/run/host-services/ssh-auth.sock" -v /var/run/docker.sock:/var/run/docker.sock ghcr.io/basecamp/kamal:latest'

# helpers
alias h='eval $(history 1000 | fzf | sed "s/ *[0-9]* *//")'
alias fzfo='fzf --bind "enter:execute(echo {})+execute(open {})"'
alias fzfd='fzf --bind "enter:execute(cd $(dirname {}))"'

export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
export NEOBRO_DECRYPTION_KEY=VN4ZZ*DPbkBcosE@-RBP9Pd2LhVELLTwR6ZVE9HdvnxZEoEZer
