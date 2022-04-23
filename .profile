#!/bin/sh
# NB: Needs to remain compatible with bash/dash/sh/zsh and ion !!

# For ion compatibility
! type -p 'source-sh' > /dev/null && alias source-sh='.'

# Setup nix
test -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' && source-sh '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
test -e /etc/static/bashrc && source-sh "$(grep -o '/nix/store/[0-9a-z]\{32\}-set-environment' < /etc/static/bashrc)"
test -e "${HOME}/.nix-profile/etc/profile.d/nix.sh" && source-sh "${HOME}/.nix-profile/etc/profile.d/nix.sh"

test -d "${HOME}/.cargo/bin" && export PATH="${HOME}/.cargo/bin:${PATH}"

test -x /usr/share/nvm/nvm.sh && . /usr/share/nvm/nvm.sh
export NVM_DIR="${HOME}/.nvm"

# Install omniprompt
! test -x "${HOME}/.cargo/bin/omniprompt" && type -p 'cargo' > /dev/null && ! cargo install --git https://github.com/spease/omniprompt.git && type -p 'cargo' > /dev/null && cargo install --git https://github.com/spease/omniprompt.git --no-default-features

# Install vim-plug
! test -e "${HOME}/.vim/autoload/plug.vim" && curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && vim -c 'PlugInstall' -c 'qa!'

### Interactive stuff ###

# Start ssh-agent if needed
! test -S "${HOME}/.ssh/ssh_auth_sock" && eval "$(ssh-agent)" && ln -sf "${SSH_AUTH_SOCK}" "${HOME}/.ssh/ssh_auth_sock"
export SSH_AUTH_SOCK="${HOME}/.ssh/ssh_auth_sock"
ssh-add -l > /dev/null || ssh-add

# Set color shell
export TERM='xterm-256color'

export PATH="${HOME}/.bin:${PATH}"

test -x /bin/nu && exec /bin/nu
test -x /run/current-system/sw/bin/nu && exec /run/current-system/sw/bin/nu
test -x /bin/zsh && exec /bin/zsh
