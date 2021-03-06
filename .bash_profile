# virtualenv
export WORKON_HOME=$HOME/code/.virtualenvs
export PROJECT_HOME=$HOME/code
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
source /usr/local/bin/virtualenvwrapper.sh

# Command line emoji see where output starts on long commands
export PS1="\u@\h \w 🍔  "

# Alias for projects
alias ls="ls -G"
alias tb="workon TB_Automator && cd ~/Projects/TB_Automator && clear"
alias cor="./welcome.sh"
alias corhome="cd ~/Projects/CorrelatePro && clear"
alias claer="clear"
alias js="cd ~/Code/JS && clear"
alias gb="cd ~/Documents/Greenbridge_Consulting && clear"
alias feg="cd ~/Documents/Greenbridge_Consulting/FEG && clear"
alias ncsa="cd ~/Documents/Greenbridge_Consulting/NCSA && clear"
alias bento="cd ~/Documents/Greenbridge_Consulting/Bento && clear"
alias art="workon art && cd ~/jacobmartinezdesigns && clear"

# Editor
alias vim="TERM=screen-256color vim"

# Surf the web in terminal
alias w3m="w3m -num www.duckduckgo.com"

# Docker & django quick commands local
alias wo="workon correlate_pro"
alias edm="eval \$(docker-machine env dev)"
alias mm="docker-compose -f local.yml run django python manage.py makemigrations"
alias m="docker-compose -f local.yml run django python manage.py migrate"
alias b="docker-compose -f local.yml build"
alias u="docker-compose -f local.yml up"

# Docker & django quick commands prod 
alias mmp="docker-compose -f production.yml run django python manage.py makemigrations"
alias mp="docker-compose -f production.yml run django python manage.py migrate"
alias bp="docker-compose -f production.yml build"
alias upd="docker-compose -f production.yml up -d"
