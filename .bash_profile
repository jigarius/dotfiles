# Change prompt format
PS1='\[\033[00;32m\]\u@\h\[\033[00m\]:\[\033[00;33m\]\W\[\033[00m\]\$ '

# Add SSH identities
ssh-add ~/.ssh/id_rsa 2>/dev/null

# Enable color in CLI
export CLICOLOR=1
export TERM=xterm-256color 

# Add GPG identities
export GPG_TTY=$(tty)

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Includes 
source ~/Scripts/aliases.sh
source ~/Scripts/functions.sh
source ~/Scripts/user.sh

