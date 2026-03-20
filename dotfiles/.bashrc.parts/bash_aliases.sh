source ~/.bash_completion.d/complete_alias

# Use bash-completion, if available, and avoid double-sourcing
[[ $PS1 &&
  ! ${BASH_COMPLETION_VERSINFO:-} &&
  -f /usr/share/bash-completion/bash_completion ]] &&
    . /usr/share/bash-completion/bash_completion

alias d='docker'
alias dc='docker-compose'
alias journal='vim ~/text/journal.md'
alias bighistory='cat ~/text/bash-history/* <(history)'
alias g='git'
alias gb='git branch'
alias gd='git diff'
alias ga='git add'
alias gco='git checkout'
alias gst='git status'
alias gpl='git pull'
alias gps='git push'
alias redshift='
temp_credentials=$(AWS_PROFILE=wair-$ENVIRONMENT aws redshift-serverless get-credentials --workgroup wair-$ENVIRONMENT);
PGCLIENTENCODING=utf-8 PGSSLMODE=require PGPASSWORD=$(echo $temp_credentials | jq -r .dbPassword) AWS_PROFILE=wair-$ENVIRONMENT pgcli -p 5439 -h redshift-private-db.$ENVIRONMENT.infra.wair.network -u $(echo $temp_credentials | jq -r .dbUser) -d ${DBNAME:-wair}
'


complete -F _complete_alias d
complete -F _complete_alias dc
complete -F _complete_alias g
complete -F _complete_alias gb
complete -F _complete_alias gd
complete -F _complete_alias ga
complete -F _complete_alias gco
complete -F _complete_alias gst
complete -F _complete_alias gpl
complete -F _complete_alias gps
