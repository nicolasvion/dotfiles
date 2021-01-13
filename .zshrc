# ============================ #
#        INSTANT PROMPT        #
# ============================ #

# mode to enable perf infos
# zmodload zsh/zprof

# Powerlevel10k instant prompt (doit rester en haut)
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# ============================ #
#            THEME             #
# ============================ #

# ZSH_THEME="nord"
ZSH_THEME="powerlevel10k/powerlevel10k"

# ============================ #
#          VARIABLES           #
# ============================ #

export ZSH="$HOME/.oh-my-zsh"
export GOROOT="/usr/local/opt/go/libexec"
export GOPATH="$HOME/.go"
export GPG_TTY="$(tty)"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin:/Users/nicolas.vion/Library/Python/3.14/bin:/Users/nicolas.vion/.bin:/Users/nicolas.vion/.local/bin"
export K9S_SKIN="nord"
export HISTFILE="$HOME/.zsh/histfile"
export LESSHISTSIZE=0
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES   # ansible on mac
export BAT_THEME="Nord"
export DISABLE_AUTO_UPDATE="true"

# ============================ #
#           PLUGINS            #
# ============================ #

plugins=(
  macos
  iterm2
  percol
  gpg-agent
  git
  python
)

# ============================ #
#           MAPPINGS           #
# ============================ #

# Patch fn + delete on mac os
bindkey "\e[3~" delete-char

# Alt + arrow to move by word
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

# ============================ #
#          FUNCTIONS           #
# ============================ #

function exists { which $1 &> /dev/null }

function tmux-work {
  tmux new-session -d -s work -n ssh "cd ~/ && zsh"
  tmux new-window -t work:1 -n github "cd ~/work/github && nvim"
  tmux new-window -t work:2 -n gitlab "cd ~/work/dev && nvim"
  tmux new-window -t work:3 -n dev "cd ~/ && zsh"
  tmux select-window -t work:2
  tmux attach-session -t work
}

function update_os() {
  softwareupdate -l
  echo 'Continue (y/n) ?'
  read -s rep
  if [[ $rep = "y" ]]
  then
    sudo softwareupdate -i -a -R
    echo "Updates in progress ..."
  else
    echo "No updates ..."
  fi
}

function create_doc() {
  sujet=$1
  project=$2
  if [[ ! $# -eq 2 ]]
  then
    echo "Usage: create_doc myclient myproject"
    read rep
  fi
  mkdir -p ~/work/documentations/$sujet/$project
  cp -rf ~/work/documentations/templates/{Makefile,src,images,templates} ~/work/documentations/$sujet/$project/
  cd ~/work/documentations/$sujet/$project/
  gsed -i "s/docs/$sujet-$project/g" Makefile
  tmux new-window 'documentations'
}

function c() {
  pushd "$(dirs -lv | cut -f2 | fzf)"
}

function dmg(){
  hdiutil create -encryption -stdinpass -srcfolder "$1" -volname "$2" "$2.dmg"
}

function to_utf8(){
  iconv -f ISO-8859-9 -t UTF-8 $1 > $1.tmp
  if [[ $error -eq 0 ]]; then
    echo "converting $1..."
    mv -f $1.tmp $1
  else
    echo "error on $1"
  fi
}

function t() {
  find -E "${1:-.}" -maxdepth "${2:-3}" \
    -not -regex ".*\/((.idea|.git|.venv|node_modules|venv)\/.*|.DS_Store)" \
  | sort | sed \
    -e "s/[^-][^\/]*\// ├ /g" \
    -e "s/├ \//├ /g" \
    -e "s/├  ├/│  ├/g" \
    -e "s/├  ├/│  ├/g" \
    -e "s/├  │/│  │/g" \
    -e '$s/├/└/'
}

# ============================ #
#      FZF CONFIGURATION       #
# ============================ #

# Key bindings and fuzzy completion
eval "$(fzf --zsh)"

# FZF theme
export FZF_DEFAULT_OPTS="
  --color=fg:#D8DEE9,bg:#2E3440,hl:#8FBCBB
  --color=fg+:#ECEFF4,bg+:#3B4252,hl+:#88C0D0
  --color=info:#81A1C1,prompt:#B48EAD,pointer:#B48EAD
  --color=marker:#8FBCBB,spinner:#5E81AC,header:#B48EAD
"

# Use fd instead of fzf's default find
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

source ~/.local/bin/fzf-git.sh

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_comprun() {
  local command=$1
  shift
  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# ============================ #
#         COMPLETION           #
# ============================ #

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle -e ':completion:*:hosts' hosts 'reply=(
   ${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2>/dev/null))"}%%\#*}
   ${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2>/dev/null)"}:#host *}#host }:#*\**}:#*\?*}}
   ${=${${${${(@M)${(f)"$(cat ~/.ssh/config.d/pro 2>/dev/null)"}:#host *}#host }:#*\**}:#*\?*}}
   ${=${${${${(@M)${(f)"$(cat ~/.ssh/config.d/bastion_config 2>/dev/null)"}:#host *}#host }:#*\**}:#*\?*}}
)'

# ================= #
#        PERF       #
# ==================#

# zstyle ':compinstall' filename '~/.zshrc'
zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
if [[ -f $zcompdump && (! -s $zcompdump || $zcompdump -ot $zcompdump.zwc) ]]; then
  zcompile $zcompdump
fi
autoload -Uz compinit
compinit -d ~/.zcompdump

# disabling permissions checks (not on multi-user laptop !)
ZSH_DISABLE_COMPFIX=true

# ============================ #
#        INIT OH-MY-ZSH        #
# ============================ #

source $ZSH/oh-my-zsh.sh

# ============================ #
#      INIT CUSTOM SOURCE      #
# ============================ #

for file in $(ls -1 ~/.env)
do
  source ~/.env/$file
done

# ============================ #
#      POWERLEVEL10K PROMPT    #
# ============================ #

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ============================ #
#           ALIAS              #
# ============================ #

eval "$(zoxide init zsh)"
alias cd="z"

alias v="BAT_THEME='Nord' /usr/local/bin/nvim -X"
alias vim="BAT_THEME='Nord' /usr/local/bin/nvim -X"
alias vimg="color=gruvbox nvim -X"
alias date="/usr/local/bin/gdate"
alias :q="exit"

alias brew-update-all="brew cu -a ; brew update ; brew upgrade ; update_os"
alias brew-repair="brew update-reset && brew update"
alias brew-generate-brewfile="brew bundle dump"
alias brew-check-brewfile="brew bundle check"

alias ossh="ssh -t bastion ssh '$@'"
alias ossh-proxy="ssh -fN -L 8443:localhost:8443 -D 1234 bastion"

alias ovault="vault"
alias ovault-login="vault login -method=ldap username='nvion'"

alias kubectl='/usr/local/share/google-cloud-sdk/bin/kubectl'
alias tg="/usr/local/bin/topgun"

alias awsec2instances=~/.bin/awsec2instances

alias ls="eza --icons=always --long --no-filesize --no-time --no-user --no-permissions"

# end perf infos mode
# zprof
