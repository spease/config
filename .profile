# NB: Needs to remain compatible with bash/dash/sh/zsh and ion !!

# Setup nix
test -e "${HOME}/.nix-profile/etc/profile.d/nix.sh" && source-sh "${HOME}/.nix-profile/etc/profile.d/nix.sh"

type "cargo" > /dev/null && export PATH="${HOME}/.cargo/bin:${PATH}"

# For ion compatibility
type "source-sh" > /dev/null || alias source-sh='source'

# https://medium.com/@augusteo/simplest-way-to-sync-dotfiles-and-config-using-git-14051af8703a
alias config-init='echo "git clone --bare git\@github.com:spease/config.git \${HOME}/.cfg && git --git-dir=\${HOME}/.cfg config --local status.showUntrackedFiles no && alias config=\"/usr/bin/git --git-dir=\${HOME}/.cfg/ --work-tree=\${HOME} && config checkout"'
alias config="/usr/bin/git --git-dir=${HOME}/.cfg/ --work-tree=${HOME}"

type "exa" > /dev/null && alias ls='exa' && alias ll='exa -alF' || alias ll='ls -al' && test "$(uname)" = "Linux" && alias ls='ls --color=auto'

test -s /usr/share/nvm/nvm.sh && source /usr/share/nvm/nvm.sh
export NVM_DIR="${HOME}/.nvm"

# Install omniprompt
type "cargo" > /dev/null && test -x "${HOME}/.cargo/bin/omniprompt" || cargo install --git https://github.com/spease/omniprompt.git || cargo install --git https://github.com/spease/omniprompt.git --no-default-features

# Install vim-plug
! test -e "${HOME}/.vim/autoload/plug.vim" && curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && vim -c 'PlugInstall' -c 'qa!'
