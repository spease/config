# NB: Needs to remain compatible with bash/dash/sh/zsh and ion !!
export PATH="${HOME}/.cargo/bin:${PATH}"

# https://medium.com/@augusteo/simplest-way-to-sync-dotfiles-and-config-using-git-14051af8703a
alias config-init='echo "git clone --bare git\@github.com:spease/config.git \${HOME}/.cfg && git --git-dir=\${HOME}/.cfg --local status.showUntrackedFiles no"'
alias config="/usr/bin/git --git-dir=${HOME}/.cfg/ --work-tree=${HOME}"

alias ll="ls -al"
alias ls='ls --color=auto'

# [[ -s /usr/share/nvm/nvm.sh ]] && source /usr/share/nvm/nvm.sh
export NVM_DIR="${HOME}/.nvm"

# Install vim-plug
test -e ~/.vim/autoload/plug.vim || curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
