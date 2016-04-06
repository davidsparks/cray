LS_COLORS='di=32:fi=37:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
export LS_COLORS

PS1="\[\033[0;32m\]\u@\H \[\033[0;36m\]\w\[\033[0;32m\]\$(parse_git_branch_and_add_brackets) \[\033[0;36m\]\\$\[\033[00m\] "

alias d='ls -aFhl --color=auto'
alias ..='cd ..; d'
alias bashrc='vim ~/.bashrc'
alias rebash='source ~/.bashrc'

alias www='cd /vagrant/www && d'

alias nowdate='date +"%y%m%d"'
alias nowtime='date +"%y%m%d_%H%M%S"'

alias cphtrob='cp .htaccess .htaccess_`nowdate`; cp robots.txt robots.txt_`nowdate`'
alias rphtrob='cp .htaccess_`nowdate` .htaccess; cp robots.txt_`nowdate` robots.txt'

alias dcc='drush cc all'
alias dccm='drush cc menu'
alias dsqld='drush sql-dump --gzip --structure-tables-key=common --result-file=@DATABASE_@DATE.sql' 
alias dpml='drush pml --no-core --type=module --status=enabled --pipe'

alias gs='git status'
alias gt='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias gp='git pull'

function cs() { cd $1; d; }

function parse_git_branch_and_add_brackets() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}