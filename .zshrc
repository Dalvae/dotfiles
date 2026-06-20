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

# ── Kitty font/theme presets (fontpreset/themepreset/fontedit/themeedit) ──
# Cambiar preset de fuente de kitty: fontpreset <nombre> | fontpreset (lista)
fontpreset() {
  local d="$HOME/.config/kitty/fonts" link="$HOME/.config/kitty/font.conf"
  if [ -z "$1" ]; then
    echo "presets:"; ls "$d" 2>/dev/null | sed 's/\.conf$//' | sed 's/^/  /'
    echo "activo: $(basename "$(readlink "$link" 2>/dev/null)" .conf)"
    return 0
  fi
  [ -f "$d/$1.conf" ] || { echo "no existe '$1'. hay:"; ls "$d" | sed 's/\.conf$//'; return 1; }
  ln -sf "fonts/$1.conf" "$link" && pkill -USR1 -x kitty 2>/dev/null
  echo "fuente -> $1 (recargado)"
}
# autocompletado TAB para fontpreset (lee la carpeta en vivo)
_fontpreset() { compadd $(ls ~/.config/kitty/fonts/ 2>/dev/null | sed 's/\.conf$//'); }
compdef _fontpreset fontpreset

# Recargar kitty a mano (aplica cualquier edición de config)
alias kittyreload='pkill -USR1 -x kitty 2>/dev/null'

# Editar el preset de fuente ACTIVO y recargar al guardar (nunca editas el equivocado)
fontedit() {
  local target="$HOME/.config/kitty/$(readlink "$HOME/.config/kitty/font.conf")"
  ${EDITOR:-nvim} "$target" && pkill -USR1 -x kitty 2>/dev/null && echo "recargado: $(basename "$target" .conf)"
}

# Cambiar tema de kitty: themepreset <nombre> | themepreset (lista)
themepreset() {
  local d="$HOME/.config/kitty/themes" link="$HOME/.config/kitty/theme.conf"
  if [ -z "$1" ]; then
    echo "temas:"; ls "$d" 2>/dev/null | sed 's/\.conf$//' | sed 's/^/  /'
    echo "activo: $(basename "$(readlink "$link" 2>/dev/null)" .conf)"
    return 0
  fi
  [ -f "$d/$1.conf" ] || { echo "no existe '$1'. hay:"; ls "$d" | sed 's/\.conf$//'; return 1; }
  ln -sf "themes/$1.conf" "$link" && pkill -USR1 -x kitty 2>/dev/null
  echo "tema -> $1 (recargado)"
}
# autocompletado TAB para themepreset
_themepreset() { compadd $(ls ~/.config/kitty/themes/ 2>/dev/null | sed 's/\.conf$//'); }
compdef _themepreset themepreset

# Editar el tema ACTIVO y recargar al guardar
themeedit() {
  local target="$HOME/.config/kitty/$(readlink "$HOME/.config/kitty/theme.conf")"
  ${EDITOR:-nvim} "$target" && pkill -USR1 -x kitty 2>/dev/null && echo "recargado: $(basename "$target" .conf)"
}
