#
# ~/.bashrc
#

# If not running interactively, don't do anything
! test "${0}" = "bash" && ! test "${0}" = "-bash" && return
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '
PS1="$(omniprompt)"

shopt -s autocd
shopt -s checkwinsize

#. ~/tools/bin/include-git-completion.bash
#export PS1='[\D{%d %a %T} \u(h=\! c=\#) \w$(__git_ps1 " (%s)")] \$ '
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
