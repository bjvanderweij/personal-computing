source ~/.bash_completion.d/complete_alias

alias dc='docker-compose'
alias journal='vim ~/the-lounge/did/personal-did/journal.md'
alias g='git'
alias gco='git checkout'

complete -F _complete_alias dc
complete -F _complete_alias g
complete -F _complete_alias gco
