#!/bin/sh
# NB: Needs to remain compatible with bash/dash/sh/zsh and ion !!

# For ion compatibility
! type -p 'source-sh' > /dev/null && alias source-sh='.'

# Setup nix
test -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' && source-sh '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
test -e /etc/static/bashrc && source-sh "$(grep -o '/nix/store/[0-9a-z]\{32\}-set-environment' < /etc/static/bashrc)"
test -e "${HOME}/.nix-profile/etc/profile.d/nix.sh" && source-sh "${HOME}/.nix-profile/etc/profile.d/nix.sh"

test -d "${HOME}/.cargo/bin" && export PATH="${HOME}/.cargo/bin:${PATH}"

test -x /usr/share/nvm/nvm.sh && source-sh /usr/share/nvm/nvm.sh && export NVM_DIR="${HOME}/.nvm"
test -s "${HOME}/.config/nvm/nvm.sh" && export NVM_DIR="${HOME}/.config/nvm" && source-sh "${NVM_DIR}/nvm.sh"

# Install omniprompt
! test -x "${HOME}/.cargo/bin/omniprompt" && type -p 'cargo' > /dev/null && ! cargo install --git https://github.com/spease/omniprompt.git && type -p 'cargo' > /dev/null && cargo install --git https://github.com/spease/omniprompt.git --no-default-features

# Install vim-plug
! test -e "${HOME}/.vim/autoload/plug.vim" && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && vim -c 'PlugInstall' -c 'qa!'

### Interactive stuff ###

# Start ssh-agent if needed
HOSTNAME="$(hostname)"
test -z "${SSH_AUTH_SOCK}" && ! pgrep ssh-agent > /dev/null && export SSH_AUTH_SOCK="${HOME}/.ssh/ssh-agent.${HOSTNAME}.sock" && ( ssh-add -l > /dev/null 2> /dev/null; test $? -ge 2 && ssh-agent -a "${SSH_AUTH_SOCK}" >/dev/null )

# Set color shell
export EDITOR='vim'

export PATH="${HOME}/.bin:${PATH}"

export ANDROID_HOME=/opt/android-sdk
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable
export PATH="${PATH}:${ANDROID_HOME}/tools/bin"
export PATH="${PATH}:${ANDROID_HOME}/platform-tools"

export PS1="\$(omniprompt \$?)"

test -x /bin/zsh && exec /bin/zsh
