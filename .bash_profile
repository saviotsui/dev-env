##############################################################################################################################
# Python
##############################################################################################################################
# Required for pyenv
export PYENV_ROOT=/usr/local/opt/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH="~/.local/bin:${PATH}"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"

##############################################################################################################################
# GIT
##############################################################################################################################
# Git branch in good-looking prompt.
# Prompt with Git branch
# Explanation of the weird lines: \u Username, \h Host, \w Path, tput setaf is the color definition
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# Bonus track: SSH autocompleting hostnames, write ssh and press tab
complete -W "$(while read line; do echo ${line%%[, ]*}; done < ~/.ssh/known_hosts)" ssh
 
# Git autocompletion
# Requires that you execute the following commented line:
# curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
test -f ~/.git-completion.bash && . $_

##############################################################################################################################
# Development
##############################################################################################################################
# Path to your working dev folder
export DEV_WS=/Users/stsui/dev
export WS=/Users/stsui/dev/agv

#################
# Voyager Service
#################

# Give Java default some more heap space so Ant doesn't die
export JAVA_OPTS='-Xms1024m -Xmx2048m -XX:PermSize=1024m'

# Ant Settings
export ANT_HOME=$WS/voyager_service/BuildSystem/buildsupport/apache-ant-1.9.6
export ANT_OPTS="-Xms1024m -Xmx2048m -Divy.repository.dir=file:\\/Volumes/ivyreps"
export PATH=$PATH:$ANT_HOME/bin

#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_172.jdk/Contents/Home

# Add Java home to path
export PATH=$HOME:$JAVA_HOME/bin:$PATH

# Path to build output location
export OUTPUT_ROOT=$WS/build

# Path to the build system folder
export BUILD_SYSTEM_ROOT=$WS/voyager_service/BuildSystem

# Path to the folder that contains the service and interface repos
export NGATWS=$WS/voyager_service
export BUILD_PATH=$NGATWS

##################
# GCO Build System
##################
export GCO_BUILD_SYSTEM_ROOT=$DEV_WS/gcosrt/gco-buildsystem
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export JAVA_HOME=$GCO_BUILD_SYSTEM_ROOT/java/deps/jdk/current/Mac
export GRADLE_HOME=$GCO_BUILD_SYSTEM_ROOT/java/deps/gradle/current

# Add Java home to path
export PATH=$GRADLE_HOME/bin:$PATH

# Vault
export PATH=$DEV_WS/tools:$PATH

#########
# Angular
#########
# Angular Projects, adding node_modules to path
export PATH=./node_modules/.bin:$PATH

#########
export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
#########

##############################################################################################################################
# Other Development
##############################################################################################################################
export PATH=$PATH:/Users/stsui/bin

# SSH tunnel to machine (localhost)
tunnel() {
    command ssh -nNT -L $1:BELMJ04MZ89.sea.corp.expecn.com:$1 stsui@localhost
}

eval $(/usr/libexec/path_helper -s)

#######
# Azure
#######
source '/Users/stsui/lib/azure-cli/az.completion'

##############################################################################################################################
# Aliases
##############################################################################################################################
alias macdev="cd ~/dev"
alias macdevair="cd ~/dev/gcoa"
alias macdevvoy="cd ~/dev/agv"

##############################################################################################################################
# Terminal Colors
##############################################################################################################################
# I like tunning the colors of the prompt in the first place:
export CLICOLOR='true'
export LSCOLORS="gxfxcxdxbxCgCdabagacad"
export EDITOR=vi
export PATH="/Applications/HPE_Security/Fortify_SCA_and_Apps_17.20/bin:$PATH"

source ~/.bashrc
