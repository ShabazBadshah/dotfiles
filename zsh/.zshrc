# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/shabazbadshah/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

PATH=$PATH:~/.npm-packages/bin

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Paths
PROJ="$HOME/Projects"
DESK="$HOME/Desktop"
DOWN="$HOME/Downloads"

alias ls='ls -lFGh'
alias la='ls -laFGh'
alias ..='cd ..'
alias ...='cd ../..'
alias c='clear'
alias tree='tree -C'
alias cls='clear'
alias cat='cat -b'
alias mkdir='mkdir -p'
alias l='ls'
alias mv='mv -inv'
alias cp='cp -vnR'

# Uses program trash-cli (source: https://github.com/andreafrancia/trash-cli)
alias rm='echo "rm is disabled, use trash-cli commands instead"'

# Matches title bar color of terminal (https://codematters.blog/custom-iterm2-titlebar-background-colors-a088c6f2ec60)
echo -e "\033]6;1;bg;red;brightness;40\a"
echo -e "\033]6;1;bg;green;brightness;44\a"
echo -e "\033]6;1;bg;blue;brightness;52\a"

alias rsync="echo rsync is disabled, use rsync-dry or rsync-not-dry to copy files"

# Encrypts a file using a AES-256-CBC key
function aescrypt() {
	if [ "$#" -ne 2 ]; then
    printf "Usage: aescrypt <key path> <input file path>"
	else

		CURR_DATE_TIME=`date "+%Y-%m-%d-%H:%M:%S"`
		BACKUP_PATH="$HOME/.aescrypt-backup/encrypt"
		command mkdir -p $BACKUP_PATH

		KEY=$1
		INPUT_PATH=$2
		OUTPUT_PATH="$2.enc"
		BACKUP_FILE_NAME="$INPUT_PATH-$CURR_DATE_TIME"

		printf "Creating backup of existing file to $BACKUP_PATH\n"
		command cp -v $INPUT_PATH $BACKUP_PATH/$BACKUP_FILE_NAME

		printf "\nEncrypting file $INPUT_PATH using key $KEY\n"
		command openssl aes-256-cbc -v -e -k $KEY -in $INPUT_PATH -out $OUTPUT_PATH
		EXIT_STATUS=$?
		printf "\nEncrypting file $INPUT_PATH using key $KEY returned status $EXIT_STATUS\n"

		if [ $EXIT_STATUS -ne 0 ]; then
			printf "\nThere was an error encrypting $INPUT_PATH. View the original backup at $BACKUP_PATH/$BACKUP_FILE_NAME"
		else
			printf "\nEncrypted file saved to $OUTPUT_PATH\n"
			printf "\nRemoving backup of original file $BACKUP_PATH/$BACKUP_FILE_NAME\n"
			command rm -v $BACKUP_PATH/$BACKUP_FILE_NAME
		fi
	fi
}

# Decrypts a file using a AES-256-CBC key
function aesdecrypt() {
	if [ "$#" -ne 3 ]; then
    printf "Usage: aesdecrypt <key path> <input file path> <output file path>"
	else

		CURR_DATE_TIME=`date "+%Y-%m-%d-%H:%M:%S"`
		BACKUP_PATH="$HOME/.aescrypt-backup/decrypt"
		command mkdir -p $BACKUP_PATH

		KEY=$1
		INPUT_PATH=$2
		OUTPUT_PATH=$3
		BACKUP_FILE_NAME="$INPUT_PATH-$CURR_DATE_TIME"
		
		printf "Creating backup of existing file to $BACKUP_PATH\n"
		command cp -v $INPUT_PATH $BACKUP_PATH/$BACKUP_FILE_NAME

		printf "\nDecrypting file $INPUT_PATH using key $KEY\n"
		command openssl aes-256-cbc -v -d -k $KEY -in $INPUT_PATH -out $OUTPUT_PATH
		EXIT_STATUS=$?
		printf "\nDecrypting file $INPUT_PATH using key $KEY returned status $EXIT_STATUS\n"

		if [ $EXIT_STATUS -ne 0 ]; then
			printf "\nThere was an error decrypting $INPUT_PATH. View the original backup at $BACKUP_PATH/$BACKUP_FILE_NAME"
		else
			printf "\nDecrypted file saved to $OUTPUT_PATH\n"
			printf "\nRemoving backup of original file $BACKUP_PATH/$BACKUP_FILE_NAME\n"
			command rm -v $BACKUP_PATH/$BACKUP_FILE_NAME
		fi
	fi
}


function rsync-dry() {
	if [ "$#" -ne 2 ]; then
    printf "Usage: rsync-dry source target"
	else
		printf "Running rsync-dry from $1 to $2\n\n"
		\rsync -avn --delete --exclude=".DS_Store" --exclude="node_modules" $1 $2
		printf  "\nDone dry syncing files from $1 to $2\n"
	fi
}

function rsync-not-dry() {
	if [ "$#" -ne 2 ]; then
    printf "Usage: rsync-not-dry source target"
	else
		printf "Running rsync-not-dry from $1 to $2\n\n"
		\rsync -av --delete --exclude=".DS_Store" --exclude="node_modules" $1 $2
		printf  "\nDone syncing files from $1 to $2\n"
	fi
}

# cd and ls the directory
function cd () {
	# Using my alias for ls
	builtin cd "$1" && ls
}

function mkcd() {
	 mkdir $1 && cd $1
}