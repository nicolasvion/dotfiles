# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# zshrc configuration with theme nord
# https://raw.githubusercontent.com/TyWR/Nord-zsh/master/tywr.zsh-theme

# ---------- theme ---------- #

# ZSH_THEME="nord"
ZSH_THEME="powerlevel10k/powerlevel10k"

# ---------- variables ---------- #

export ZSH=$HOME/.oh-my-zsh
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/.go
export GPG_TTY=$(tty)
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:/Users/nicolas.vion/Library/Python/3.13/bin:/Users/nicolas.vion/.bin
export HISTFILE=~/.zsh/histfile
export LESSHISTSIZE=0
# ansible on mac
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
eval "$(gdircolors ~/.dir_colors)"

# ---------- mappings ---------- #

# patch fn + delete on mac os
bindkey "\e[3~" delete-char

# alt + arrow to move by word
# https://stackoverflow.com/questions/12382499/looking-for-altleftarrowkey-solution-in-zsh
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

# ---------- functions ---------- #

function exists { which $1 &> /dev/null }

function tmux-work {
  tmux new-session -d -s work 'cd ~/ ; taskell'
  tmux split-window -p 1 -v 'cmus'
  tmux new-window -t work:1 -n github 'cd ~/work/github && nvim'
  tmux new-window -t work:2 -n gitlab 'cd ~/work/gitlab && nvim'
  tmux new-window -t work:3 -n dev 'cd ~/work/dev && nvim'
  tmux new-window -t work:4 -n bastion 'ssh -Nf -L 8443:localhost:8443 -D 1234 bastion && cd ~/work/'

  tmux select-window -t work:2
  tmux -2 attach-session -t work:2
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

# ---------- alias ---------- #

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

alias kubectl='/usr/local/Cellar/kubernetes-cli/1.34.0/bin/kubectl'
alias tg="/usr/local/bin/topgun"

# ---------- plugins ---------- #

plugins=(
  macos
  iterm2
  percol
  gpg-agent
  ansible
  git
  aws
  docker
  docker-compose
  python
)


# ---------- completion ---------- #

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle -e ':completion:*:hosts' hosts 'reply=(
   ${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2>/dev/null))"}%%\#*}
   ${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2>/dev/null)"}:#host *}#host }:#*\**}:#*\?*}}
   ${=${${${${(@M)${(f)"$(cat ~/.ssh/config.d/pro 2>/dev/null)"}:#host *}#host }:#*\**}:#*\?*}}
   ${=${${${${(@M)${(f)"$(cat ~/.ssh/config.d/bastion_config 2>/dev/null)"}:#host *}#host }:#*\**}:#*\?*}}
)'


# ---------- init zsh ---------- #

source $ZSH/oh-my-zsh.sh

# ---------- init custom source ---------- #

for file in $(ls -1 ~/.env)
do
  source ~/.env/$file
done

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
