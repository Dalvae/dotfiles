# Oh-My-Zsh base configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# History configuration
SAVEHIST=10000
HISTFILE=~/.zsh_history

# GPG configuration
export GPG_TTY=$(tty)

# Aliases - Git
alias g="git"
alias gad="git add --all"
alias gcm="git commit -m"
alias gcms="git commit -S -m"
alias gph="git push"
alias gpl="git pull"
alias gcl="git clone"
alias gin="git init"
alias gst="git status"
alias glg="git log -n 5"
alias glgr="git reflog"
alias gdf="git diff"
alias gbr="git branch"
alias gsw="git switch"
alias gch="git checkout"
alias gra="git remote add origin git@github.com:"
alias grs="git remote set-url origin git@github.com:"

# Aliases - System
alias yeet="yay -Rn"
alias yeeet="yay -Rns"
alias yeet_useless="yay -Rns $(yay -Qtdq)"
alias install="sudo pacman -S"
alias nv="nvim"
alias la="ls -alF"
alias h="history|grep"
alias c="clear"
alias logout="killall -KILL -u $USER"
alias files="nemo"
alias files.="nemo ."
alias help="cat ~/.zshrc | less"

# Aliases - Navigation
alias ..="cd .."
alias ....="cd ../.."
alias ......="cd ../../.."
alias ........="cd ../../../.."

# Aliases - LLM
alias s="llm --log -s 'I am using Arch Linux with zsh shell. Provide direct shell commands without explanations unless asked' -m openrouter/meta-llama/llama-3.2-1b-instruct:free"
alias sc="llm --log -c -s 'I am using Arch Linux with zsh shell. Provide direct shell commands without explanations unless asked' -m openrouter/meta-llama/llama-3.2-1b-instruct:free"

# Path configurations
export PATH="$PATH:$HOME/.local/bin"
export PATH="$HOME/.pyenv/bin:$PATH"

# PNPM configuration
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Load evaluations
eval "$(pyenv init -)"

# Source additional files conditionally
[ -f ~/.env.secrets ] && source ~/.env.secrets
[ -f /etc/profile.d/google-cloud-cli.sh ] && source /etc/profile.d/google-cloud-cli.sh

# Terminal and NVM
export TERMINAL=kitty
source /usr/share/nvm/init-nvm.sh
